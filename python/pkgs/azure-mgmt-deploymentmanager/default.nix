{
  lib,
  azure-common,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  msrest,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-deploymentmanager";
  version = "2.0.0b2";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_deploymentmanager";
    inherit (finalAttrs) version;
    hash = "sha256-qjDX3TFAq414yA01HmEiW9jHRmestMlc2LfldjNdgdY=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    msrest
  ];

  # no tests included

  pythonImportsCheck = [
    "azure.common"
    "azure.mgmt.deploymentmanager"
  ];

  meta = {
    description = "Microsoft Azure Deployment Manager Client Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/deploymentmanager/azure-mgmt-deploymentmanager";
    license = lib.licenses.mit;
  };
})
