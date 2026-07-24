{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  click,
}:

buildPythonPackage (finalAttrs: {
  pname = "click-aliases";
  version = "1.0.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "click-contrib";
    repo = "click-aliases";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Km6rVAsdoctECEFxZG/gCnacmhdHQVJcVrOta6xh1XU=";
  };

  build-system = [ poetry-core ];

  dependencies = [ click ];
  pythonImportsCheck = [ "click_aliases" ];

  meta = {
    description = "Enable aliases for click";
    homepage = "https://github.com/click-contrib/click-aliases";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
