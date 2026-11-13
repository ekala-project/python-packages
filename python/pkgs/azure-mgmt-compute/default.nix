{
  lib,
  azure-mgmt-common,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  isodate,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-compute";
  version = "39.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_compute";
    inherit (finalAttrs) version;
    hash = "sha256-AYfdAor8urh9Q1SYzRafnlT7tXwIeFvNWQCKmgEoYfo=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-mgmt-common
    azure-mgmt-core
    isodate
  ];

  pythonNamespaces = [ "azure.mgmt" ];

  # Module has no tests

  pythonImportsCheck = [ "azure.mgmt.compute" ];

  meta = {
    description = "This is the Microsoft Azure Compute Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/compute/azure-mgmt-compute";
    license = lib.licenses.mit;
  };
})
