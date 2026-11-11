{
  lib,
  azure-core,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-cosmos";
  version = "4.17.1";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_cosmos";
    inherit (finalAttrs) version;
    hash = "sha256-1pKSilTYgWPpbUHY+JkinKL2pr8hlz7OK/wfctS07dg=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-core
    typing-extensions
  ];

  pythonNamespaces = [ "azure" ];

  # Requires an active Azure Cosmos service

  pythonImportsCheck = [ "azure.cosmos" ];

  meta = {
    description = "Azure Cosmos DB API";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/cosmos/azure-cosmos";
    license = lib.licenses.mit;
  };
})
