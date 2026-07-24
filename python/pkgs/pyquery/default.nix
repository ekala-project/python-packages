{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  cssselect,
  lxml,
}:

buildPythonPackage rec {
  pname = "pyquery";
  version = "2.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-AZS7JwaxLQN9sSxRko/p67NrctnnGVZdq6WmxZUyL68=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cssselect
    lxml
  ];

  pythonImportsCheck = [ "pyquery" ];

  meta = {
    description = "Jquery-like library for Python";
    homepage = "https://github.com/gawel/pyquery";
    license = lib.licenses.bsd3;
  };
}
