{
  lib,
  azure-core,
  buildPythonPackage,
  fetchPypi,
  isodate,
  setuptools,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-keyvault-secrets";
  version = "4.12.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_keyvault_secrets";
    inherit (finalAttrs) version;
    hash = "sha256-Q16gq7UoC6qtlVPaehnnPhtYEEh4O4UiEDUr/LAxav8=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [
    azure-core
    isodate
    typing-extensions
  ];

  pythonNamespaces = [ "azure.keyvault" ];

  # Tests require checkout from mono-repo

  meta = {
    description = "Microsoft Azure Key Vault Secrets Client Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/keyvault/azure-keyvault-secrets";
    license = lib.licenses.mit;
  };
})
