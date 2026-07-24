{
  lib,
  buildPythonPackage,
  fetchPypi,
  poetry-core,
  aiohttp,
  cryptography,
  pyjwt,
}:

buildPythonPackage rec {
  pname = "gcloud-aio-auth";
  version = "5.4.4";
  pyproject = true;

  src = fetchPypi {
    pname = "gcloud_aio_auth";
    inherit version;
    hash = "sha256-cLjG7fhlUAMlGQU3LmgVokq4Ob8gF4ipA5ZFcOm0CR8=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    aiohttp
    cryptography
    pyjwt
  ];

  pythonImportsCheck = [ "gcloud.aio.auth" ];

  # Tests require network access
  doCheck = false;

  meta = {
    description = "Python client for Google Cloud auth";
    homepage = "https://github.com/talkiq/gcloud-aio";
    license = lib.licenses.mit;
  };
}
