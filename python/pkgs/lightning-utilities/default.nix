{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  packaging,
  setuptools,

  # dependencies
  jsonargparse,
  tomlkit,
  typing-extensions,

  # tests
  pytest-timeout,
}:

buildPythonPackage (finalAttrs: {
  pname = "lightning-utilities";
  version = "0.15.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Lightning-AI";
    repo = "utilities";
    tag = "v${finalAttrs.version}";
    hash = "sha256-j997nvn6iRFvJeI8wJbickUDPc5Zyi1Lj4yG2JbaLU8=";
  };

  build-system = [
    packaging
    setuptools
  ];

  dependencies = [
    jsonargparse
    packaging
    tomlkit
    typing-extensions
  ];

  pythonImportsCheck = [ "lightning_utilities" ];
  meta = {
    description = "Common Python utilities and GitHub Actions in Lightning Ecosystem";
    homepage = "https://github.com/Lightning-AI/utilities";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
