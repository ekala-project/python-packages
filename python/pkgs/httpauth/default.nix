{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "httpauth";
  version = "0.4.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-C6rnFroAd5vOULBMwsLSyeSK5zPXOEgGHDSYt+Pm2dQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "httpauth" ];

  meta = {
    description = "WSGI HTTP Digest Authentication middleware";
    homepage = "https://github.com/jonashaag/httpauth";
    license = lib.licenses.bsd2;
  };
}
