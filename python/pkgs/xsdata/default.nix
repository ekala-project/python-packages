{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  click,
  jinja2,
  toposort,
  typing-extensions,
  lxml,
  requests,
  setuptools,
}:

buildPythonPackage rec {
  pname = "xsdata";
  version = "26.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tefra";
    repo = "xsdata";
    tag = "v${version}";
    hash = "sha256-h5VGXGXQSG4o8H+Q+Z0SN9rw4mFI8EORNtB+4VAKg/k=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "--benchmark-skip" ""
  '';

  build-system = [ setuptools ];

  dependencies = [ typing-extensions ];

  optional-dependencies = {
    cli = [
      click
      jinja2
      toposort
    ];
    lxml = [ lxml ];
    soap = [ requests ];
  };

  pythonImportsCheck = [
    "xsdata.formats.dataclass.context"
    "xsdata.formats.dataclass.models.elements"
    "xsdata.formats.dataclass.models.generics"
    "xsdata.formats.dataclass.parsers"
    "xsdata.formats.dataclass.serializers"
  ];

  meta = {
    description = "Naive XML & JSON bindings for Python";
    mainProgram = "xsdata";
    homepage = "https://github.com/tefra/xsdata";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
