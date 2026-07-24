{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  poetry-core,

  # unpropagated
  pytest,

  # propagated
  inflection,
  factory-boy,
  typing-extensions,

  # tests
}:

buildPythonPackage rec {
  pname = "pytest-factoryboy";
  version = "2.8.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pytest-dev";
    repo = "pytest-factoryboy";
    rev = version;
    sha256 = "sha256-9dMsUujMCk89Ze4H9VJRS+ihjk0PAxKb8xqlw0+ROEI=";
  };

  build-system = [ poetry-core ];

  buildInputs = [ pytest ];

  dependencies = [
    factory-boy
    inflection
    typing-extensions
  ];

  pythonImportsCheck = [ "pytest_factoryboy" ];
  meta = {
    description = "Integration of factory_boy into the pytest runner";
    homepage = "https://pytest-factoryboy.readthedocs.io/en/latest/";
    maintainers = [ ];
    license = lib.licenses.mit;
  };
}
