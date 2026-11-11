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
  pname = "azure-keyvault-administration";
  version = "4.7.2";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_keyvault_administration";
    inherit (finalAttrs) version;
    hash = "sha256-20AEREjtkBxLBHVVN80hZ9QINzdrzSJ3E5+2iB1AdHw=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [
    azure-core
    typing-extensions
    isodate
  ];

  # Tests require checkout from mono-repo

  pythonNamespaces = [ "azure.keyvault" ];

  pythonImportsCheck = [ "azure.keyvault.administration" ];

  meta = {
    description = "Microsoft Azure Key Vault Administration Client Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/master/sdk/keyvault/azure-keyvault-administration";
    license = lib.licenses.mit;
  };
})
