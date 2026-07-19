{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "ftputil";
  version = "5.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-6eYtP9MH75xS5Dsz/ZJ1n8lMBNi1F4+F9kGxg5BtQ1M=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "ftputil" ];

  meta = {
    description = "High-level FTP client library (virtual file system and more)";
    homepage = "https://ftputil.sschwarzer.net/";
    license = lib.licenses.bsd2;
  };
}
