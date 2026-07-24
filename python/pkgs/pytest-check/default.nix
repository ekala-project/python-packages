{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  pytest,
}:

buildPythonPackage rec {
  pname = "pytest_check";
  version = "2.8.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-xC4I3dQa2cOHvRbvpmSt5d7016pcYHsFup4l9aq6cMI=";
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
