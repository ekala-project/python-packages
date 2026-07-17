{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  pytest,
}:

buildPythonPackage rec {
  pname = "pytest-instafail";
  version = "0.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-M6YG9+DI5kbcO/7g1eOkt7eO98NhaM+h89k698pwbJ4=";
  };

  build-system = [ setuptools ];

  buildInputs = [ pytest ];

  doCheck = false;

  pythonImportsCheck = [ "pytest_instafail" ];

  meta = {
    description = "Pytest plugin that shows failures and errors instantly instead of waiting until the end of test session";
    homepage = "https://github.com/pytest-dev/pytest-instafail";
    license = lib.licenses.bsd3;
  };
}
