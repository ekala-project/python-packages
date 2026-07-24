{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "rarfile";
  version = "4.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-t9KdZxIjzcgOi5kt8hLRUq2I5slh1EJsP7L+/o3Yb98=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "rarfile" ];

  meta = {
    homepage = "https://github.com/markokr/rarfile";
    description = "RAR archive reader for Python";
    license = lib.licenses.isc;
  };
}
