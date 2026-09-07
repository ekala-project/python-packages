{
  lib,
  buildPythonPackage,
  fetchPypi,
  poetry-core,
  aiofiles,
  aiohttp,
  gcloud-aio-auth,
  pyasn1-modules,
  rsa,
}:

buildPythonPackage rec {
  pname = "gcloud-aio-storage";
  version = "9.6.4";
  pyproject = true;

  src = fetchPypi {
    pname = "gcloud_aio_storage";
    inherit version;
    hash = "sha256-TadB6eRfCrX1eqm6LUYDLd5LgPPrCgPeMax0Gt1CBIU=";
  };

  build-system = [ poetry-core ];

  pythonRelaxDeps = [
    "aiofiles"
    "pyasn1-modules"
  ];

  dependencies = [
    aiofiles
    aiohttp
    gcloud-aio-auth
    pyasn1-modules
    rsa
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
