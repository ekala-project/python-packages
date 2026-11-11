{
  lib,
  buildPythonPackage,
  fetchPypi,
  azure-common,
  azure-core,
  isodate,
  setuptools,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-keyvault-certificates";
  version = "4.12.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_keyvault_certificates";
    inherit (finalAttrs) version;
    hash = "sha256-7FWJwoiJ3ONg0/+ensQZ2w+sThJ74VgPikqOhzhNpOo=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [
    azure-common
    azure-core
    isodate
    typing-extensions
  ];

  pythonNamespaces = [ "azure.keyvault" ];

  # Module has no tests

  pythonImportsCheck = [ "azure.keyvault.certificates" ];

  meta = {
    description = "Microsoft Azure Key Vault Certificates Client Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/keyvault/azure-keyvault-certificates";
    license = lib.licenses.mit;
  };
})
