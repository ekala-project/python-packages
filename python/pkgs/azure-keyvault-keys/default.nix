{
  lib,
  azure-common,
  azure-core,
  buildPythonPackage,
  cryptography,
  fetchPypi,
  isodate,
  setuptools,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-keyvault-keys";
  version = "4.11.3";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_keyvault_keys";
    inherit (finalAttrs) version;
    hash = "sha256-q+JYpGk3q2mxSNGDIVAZL2owBXhFHWkwSgw74kuYgao=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-core
    cryptography
    isodate
    typing-extensions
  ];

  pythonNamespaces = [ "azure.keyvault" ];

  # Tests require relative paths to utilities in the mono-repo

  pythonImportsCheck = [
    "azure"
    "azure.core"
    "azure.common"
    "azure.keyvault"
    "azure.keyvault.keys"
  ];

  meta = {
    description = "Microsoft Azure Key Vault Keys Client Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/keyvault/azure-keyvault-keys";
    license = lib.licenses.mit;
  };
})
