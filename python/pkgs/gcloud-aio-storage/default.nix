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

buildPythonPackage (finalAttrs: {
  pname = "gcloud-aio-storage";
  version = "9.6.5";
  pyproject = true;

  src = fetchPypi {
    pname = "gcloud_aio_storage";
    inherit (finalAttrs) version;
    hash = "sha256-RKlSnkKddGDxpVtJoPd5BtmI7mhINROrs8DWbe30Or0=";
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

  meta = {
    description = "Python client for Google Cloud Storage";
    homepage = "https://github.com/talkiq/gcloud-aio";
    license = lib.licenses.mit;
  };
})
