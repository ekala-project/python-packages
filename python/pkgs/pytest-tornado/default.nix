{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  pytest,
  tornado,
}:

buildPythonPackage rec {
  pname = "pytest-tornado";
  version = "0.8.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ufoZMMMzud/im96Q+fQuZkMni10MlVKKgwKnRU/T8bE=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    pytest
    tornado
  ];

  pythonImportsCheck = [ "pytest_tornado" ];

  meta = {
    description = "Py.test plugin providing fixtures and markers for tornado applications";
    homepage = "https://github.com/eugeniy/pytest-tornado";
    license = lib.licenses.asl20;
  };
}
