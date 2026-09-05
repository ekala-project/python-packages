{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "aioftp";
  version = "0.28.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-MR9m6f9yYFX3PnR2T7YuCXq4Btoxd8E/E1bI5+r5pl0=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "aioftp" ];

  meta = {
    description = "Python FTP client/server for asyncio";
    homepage = "https://aioftp.readthedocs.io/";
    license = lib.licenses.asl20;
  };
}
