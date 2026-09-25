{
  lib,
  attrs,
  buildPythonPackage,
  cattrs,
  click-option-group,
  click,
  fetchPypi,
  hatch-vcs,
  hatchling,
  hypothesis,
  jinja2,
  pydantic,
  pytest-cov-stub,
  python-dotenv,
  pythonAtLeast,
  rich-click,
  sybil,
}:
buildPythonPackage rec {
  pname = "typed-settings";
  version = "26.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "typed_settings";
    inherit version;
    hash = "sha256-iNDaM+RAoEGfGU4kuS7M5MEufBZbW5Zpf+QUDIPThuo=";
  };

  build-system = [ hatchling ];

  optional-dependencies = {
    all = [
      attrs
      cattrs
      click
      click-option-group
      jinja2
      pydantic
    ];
    attrs = [ attrs ];
    cattrs = [ cattrs ];
    click = [ click ];
    option-groups = [
      click
      click-option-group
    ];
    jinja = [ jinja2 ];
    pydantic = [ pydantic ];
  };

  nativeBuildInputs = [ hatch-vcs ];
  pythonImportsCheck = [ "typed_settings" ];

  meta = {
    description = "Typed settings based on attrs classes";
    homepage = "https://gitlab.com/sscherfke/typed-settings";
    license = lib.licenses.mit;
  };
}
