{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "rarfile";
  version = "4.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-dCXQr6GA8AktuQOrsVJqEws2hYmAqtkLNpT0jkFCAVU=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "rarfile" ];

  meta = {
    homepage = "https://github.com/markokr/rarfile";
    description = "RAR archive reader for Python";
    license = lib.licenses.isc;
  };
}
