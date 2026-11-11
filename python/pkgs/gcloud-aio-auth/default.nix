{
  lib,
  buildPythonPackage,
  fetchPypi,
  poetry-core,
  aiohttp,
  backoff,
  chardet,
  cryptography,
  pyjwt,
  tenacity,
}:

buildPythonPackage (finalAttrs: {
  pname = "gcloud-aio-auth";
  version = "5.6.1";
  pyproject = true;

  src = fetchPypi {
    pname = "gcloud_aio_auth";
    inherit (finalAttrs) version;
    hash = "sha256-shxb46kTjFqfRXoPTjX9TtSfOfOfV/sDEcdNaHKQUYw=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    aiohttp
    backoff
    chardet
    cryptography
    pyjwt
    tenacity
  ];

  pythonImportsCheck = [ "gcloud.aio.auth" ];

  # Tests require network access

  meta = {
    description = "Python client for Google Cloud auth";
    homepage = "https://github.com/talkiq/gcloud-aio";
    license = lib.licenses.mit;
  };
})
