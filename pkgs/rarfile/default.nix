{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "rarfile";
  version = "4.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-jhyOctCEWtKzKkerEacZvC5BFl7BAf1NP+npKqP0ae8=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "rarfile" ];

  meta = {
    homepage = "https://github.com/markokr/rarfile";
    description = "RAR archive reader for Python";
    license = lib.licenses.isc;
  };
}
