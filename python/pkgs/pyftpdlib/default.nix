{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pyftpdlib";
  version = "2.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-S6BkIHh5LfY907LpyPg48qPs9CjHUY1ZIcBTDVNRKs8=";
  };

  build-system = [ setuptools ];

  pythonRemoveDeps = [
    "pyasyncore"
    "pyasynchat"
    "pysendfile"
  ];

  doCheck = false;

  pythonImportsCheck = [ "pyftpdlib" ];

  meta = {
    homepage = "https://github.com/giampaolo/pyftpdlib/";
    description = "Asynchronous FTP server library";
    license = lib.licenses.mit;
  };
}
