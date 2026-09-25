{
  lib,
  azure-common,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  isodate,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-redis";
  version = "15.0.0b1";
  pyproject = true;

  __structuredAttrs = true;

  src = fetchPypi {
    inherit (finalAttrs) version;
    pname = "azure_mgmt_redis";
    hash = "sha256-wHwNVR5UXcc9YbkCdl2nqLIw12O2NY9C1ffhHZy7nRA=";
  };

  build-system = [ setuptools ];

  dependencies = [
    isodate
    azure-common
    azure-mgmt-core
  ];

  # Module has no tests
  doCheck = false;

  pythonImportsCheck = [ "azure.mgmt.redis" ];

  meta = {
    description = "This is the Microsoft Azure Redis Cache Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
