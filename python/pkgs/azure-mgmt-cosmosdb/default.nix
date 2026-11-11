{
  lib,
  azure-common,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  isodate,
  msrest,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-cosmosdb";
  version = "10.1.0b1";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_cosmosdb";
    inherit (finalAttrs) version;
    hash = "sha256-GPMz4CMiPN++iPiOHDjiQwr3XGzFlcLCZcGQZk7nPvs=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    isodate
    msrest
  ];

  # Module has no tests

  pythonImportsCheck = [ "azure.mgmt.cosmosdb" ];

  meta = {
    description = "Module to work with the Microsoft Azure Cosmos DB Management";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
