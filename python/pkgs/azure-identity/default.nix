{
  lib,
  buildPythonPackage,
  fetchPypi,
  azure-core,
  cryptography,
  msal,
  msal-extensions,
  typing-extensions,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-identity";
  version = "1.27.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_identity";
    inherit (finalAttrs) version;
    hash = "sha256-akxQ4l6OmkezJKla0CSJflbLPGJB4AlOk7Emor9x7cU=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-core
    cryptography
    msal
    msal-extensions
    typing-extensions
  ];

  # msal in this package set lags behind upstream's lower bound
  pythonRelaxDeps = [ "msal" ];

  pythonImportsCheck = [ "azure.identity" ];

  meta = {
    description = "Microsoft Azure Identity Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/identity/azure-identity";
    license = lib.licenses.mit;
  };
})
