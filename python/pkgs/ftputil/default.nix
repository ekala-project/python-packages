{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "ftputil";
  version = "5.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-2IK6UcUDXPio+zMkCDYHVgbXYp5FasS9DoDA2jge720=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "ftputil" ];

  meta = {
    description = "High-level FTP client library (virtual file system and more)";
    homepage = "https://ftputil.sschwarzer.net/";
    license = lib.licenses.bsd2;
  };
}
