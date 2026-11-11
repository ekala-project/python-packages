{
  lib,
  azure-common,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  isodate,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-keyvault";
  version = "14.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_keyvault";
    inherit (finalAttrs) version;
    hash = "sha256-0n1BLm17W3a/x6gme449MIUsfG3FYGCex9k9SBa9Kfw=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    isodate
  ];

  pythonNamespaces = [ "azure.mgmt" ];

  pythonImportsCheck = [ "azure.mgmt.keyvault" ];

  # Module has no tests

  meta = {
    description = "This is the Microsoft Azure Key Vault Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
