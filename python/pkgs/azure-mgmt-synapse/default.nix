{
  lib,
  azure-common,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  msrest,
  msrestazure,
  setuptools,
}:

buildPythonPackage rec {
  pname = "azure-mgmt-synapse";
  version = "2.1.0b7";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-9diBVPWUofEa1LJytaDOU2FKB7nFDpayWgmnq3lx6dY=";
    extension = "zip";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    msrest
    msrestazure
  ];

  pythonImportsCheck = [ "azure.mgmt.synapse" ];

  meta = {
    description = "Microsoft Azure Synapse Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/synapse/azure-mgmt-synapse";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
