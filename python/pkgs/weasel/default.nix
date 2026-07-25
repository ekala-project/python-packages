{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  click,
  cloudpathlib,
  confection,
  httpx,
  pydantic,
  smart-open,
  srsly,
  typer,
  wasabi,

  # tests

  # passthru
  nix-update-script,
}:

buildPythonPackage (finalAttrs: {
  pname = "weasel";
  version = "1.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "explosion";
    repo = "weasel";
    tag = "release-v${finalAttrs.version}";
    hash = "sha256-yiLoLdnDfKby1Ez1hKGL9DxazQto57Zn0DlRmGLurOs=";
  };

  build-system = [ setuptools ];

  dependencies = [
    click
    cloudpathlib
    confection
    httpx
    pydantic
    smart-open
    srsly
    typer
    wasabi
  ];

  pythonImportsCheck = [ "weasel" ];
  passthru = {
    updateScript = nix-update-script {
      extraArgs = [
        "--version-regex"
        "release-v(.*)"
      ];
    };
  };

  meta = {
    description = "Small and easy workflow system";
    homepage = "https://github.com/explosion/weasel/";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "weasel";
  };
})
