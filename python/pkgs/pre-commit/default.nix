{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  cfgv,
  identify,
  nodeenv,
  pyyaml,
  toml,
  virtualenv,
}:

buildPythonPackage (finalAttrs: {
  pname = "pre-commit";
  version = "4.6.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pre-commit";
    repo = "pre-commit";
    tag = "v${finalAttrs.version}";
    hash = "sha256-aCEN9dVz/3lB2gy7U+6dVj3jSM7cmVsstOp+LHvYRsU=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    cfgv
    identify
    nodeenv
    pyyaml
    toml
    virtualenv
  ];

  pythonImportsCheck = [
    "pre_commit"
  ];

  meta = {
    description = "Framework for managing and maintaining multi-language pre-commit hooks";
    homepage = "https://pre-commit.com/";
    license = lib.licenses.mit;
    mainProgram = "pre-commit";
  };
})
