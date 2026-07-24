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
  version = "2.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-vsa9+utVtP3RWfIFXoh1v1CnILsPzoCoFukqI1m4mMg=";
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
