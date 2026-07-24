{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  mako,
  parse,
  parse-type,
  poetry-core,
  pytest,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "pytest-bdd";
  version = "7.1.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pytest-dev";
    repo = "pytest-bdd";
    tag = version;
    hash = "sha256-PC4VSsUU5qEFp/C/7OTgHINo8wmOo0w2d1Hpe0EnFzE=";
  };

  build-system = [ poetry-core ];

  buildInputs = [ pytest ];

  dependencies = [
    mako
    parse
    parse-type
    typing-extensions
  ];

  # requires an update for pytest 8.4 compat
  pythonImportsCheck = [ "pytest_bdd" ];

  meta = {
    description = "BDD library for the pytest";
    homepage = "https://github.com/pytest-dev/pytest-bdd";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "pytest-bdd";
  };
}
