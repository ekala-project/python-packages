{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  aiohttp,
  gcloud-aio-auth,
}:

buildPythonPackage rec {
  pname = "gcloud-aio-storage";
  version = "9.3.0";
  pyproject = true;

  src = fetchPypi {
    pname = "gcloud_aio_storage";
    inherit version;
    hash = "sha256-I2ZKNrLD/5E1A1s+m89RLgoMF7h04wWYUJjwAN5N45k=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aiohttp
    gcloud-aio-auth
  ];

  pythonImportsCheck = [ "gcloud.aio.storage" ];

  # Tests require network access
  doCheck = false;

  meta = {
    description = "Python client for Google Cloud Storage";
    homepage = "https://github.com/talkiq/gcloud-aio";
    license = lib.licenses.mit;
  };
}
