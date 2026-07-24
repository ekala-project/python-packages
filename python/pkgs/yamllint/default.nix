{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  pathspec,
  pyyaml,
}:

buildPythonPackage rec {
  pname = "yamllint";
  version = "1.37.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "adrienverge";
    repo = "yamllint";
    tag = "v${version}";
    hash = "sha256-CohqiBoQcgvGVP0Bt6U768BY1aIwh59YRsgzJfaDmP0=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pyyaml
    pathspec
  ];
  pythonImportsCheck = [ "yamllint" ];

  meta = {
    description = "Linter for YAML files";
    homepage = "https://github.com/adrienverge/yamllint";
    license = lib.licenses.gpl3Plus;
    maintainers = [ ];
    mainProgram = "yamllint";
  };
}
