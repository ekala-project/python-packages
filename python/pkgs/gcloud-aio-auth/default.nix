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

buildPythonPackage rec {
  pname = "gcloud-aio-auth";
  version = "5.5.0";
  pyproject = true;

  src = fetchPypi {
    pname = "gcloud_aio_auth";
    inherit version;
    hash = "sha256-VsP+8x3sbzhB9esMefr5oc0+R1+ix6GUv1FiJqo5/Rg=";
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
  doCheck = false;

  meta = {
    description = "Python client for Google Cloud auth";
    homepage = "https://github.com/talkiq/gcloud-aio";
    license = lib.licenses.mit;
  };
}
