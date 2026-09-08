{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  pytest,
}:

buildPythonPackage rec {
  pname = "pytest_check";
  version = "2.9.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-LYyfH+XM6wtBxIDhRU6V6e1qOlNL8sfj4PORZ7Ec+Is=";
  };

  build-system = [ hatchling ];

  dependencies = [ pytest ];

  pythonImportsCheck = [ "pytest_check" ];

  meta = {
    description = "Pytest plugin allowing multiple failures per test";
    homepage = "https://github.com/okken/pytest-check";
    license = lib.licenses.mit;
  };
}
