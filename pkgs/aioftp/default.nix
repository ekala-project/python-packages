{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "aioftp";
  version = "0.27.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-fASMMiAIF5bFmDKm/Z/Y+tl+POwSpQvjq8zy3LvrJho=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "aioftp" ];

  meta = {
    description = "Python FTP client/server for asyncio";
    homepage = "https://aioftp.readthedocs.io/";
    license = lib.licenses.asl20;
  };
}
