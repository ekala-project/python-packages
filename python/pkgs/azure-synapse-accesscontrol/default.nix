{
  lib,
  azure-common,
  azure-core,
  buildPythonPackage,
  fetchPypi,
  msrest,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-synapse-accesscontrol";
  version = "0.7.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-VlqiYzbVYMAod16K5Q0GkapwielhcOeDQjcbdz2jE3w=";
    extension = "zip";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-core
    msrest
  ];

  # zero tests run

  pythonImportsCheck = [ "azure.synapse.accesscontrol" ];

  meta = {
    description = "Microsoft Azure Synapse AccessControl Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/synapse/azure-synapse-accesscontrol";
    license = lib.licenses.mit;
  };
})
