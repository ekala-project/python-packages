{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  pytest,
  python-dotenv,
}:

buildPythonPackage rec {
  pname = "pytest-dotenv";
  version = "0.5.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-LcbDrG2HZMccbSgE6QLQ/4EPoZaS6V/hOK78mxqnNzI=";
  };

  build-system = [ setuptools ];

  buildInputs = [ pytest ];

  dependencies = [ python-dotenv ];

  pythonImportsCheck = [ "pytest_dotenv" ];

  meta = {
    description = "Pytest plugin that parses environment files before running tests";
    homepage = "https://github.com/quiqua/pytest-dotenv";
    license = lib.licenses.mit;
  };
}
