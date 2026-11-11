{
  lib,
  buildPythonPackage,
  fetchPypi,
  msrest,
  msrestazure,
  azure-common,
  azure-mgmt-nspkg,
  isPy3k,
  azure-mgmt-core,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-marketplaceordering";
  version = "1.1.1";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_marketplaceordering";
    inherit (finalAttrs) version;
    hash = "sha256-nIfbCLTsDG9zj18HujJrb/kvNIYZ90lXOlX6uojEcoU=";
  };

  build-system = [ setuptools ];

  dependencies = [
    msrest
    msrestazure
    azure-common
    azure-mgmt-core
  ]
  ++ lib.optionals (!isPy3k) [ azure-mgmt-nspkg ];

  # has no tests

  pythonImportsCheck = [ "azure.mgmt.marketplaceordering" ];

  meta = {
    description = "This is the Microsoft Azure Market Place Ordering Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
