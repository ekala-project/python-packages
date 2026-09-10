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
  version = "1.38.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "adrienverge";
    repo = "yamllint";
    tag = "v${version}";
    hash = "sha256-4H8tbn2TRzTGIXmP9Hnmc93rGSLsWh5A5R9KAIz0mKM=";
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
