{
  lib,
  azure-common,
  buildPythonPackage,
  fetchPypi,
  requests,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-servicemanagement-legacy";
  version = "0.20.8";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_servicemanagement_legacy";
    inherit (finalAttrs) version;
    hash = "sha256-42neKpeBjx26GTIzeBTyjTmj5tcNklNQoaBoEDjC+Xc=";
  };

  pythonRemoveDeps = [ "azure-nspkg" ];

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    requests
  ];

  pythonNamespaces = [ "azure" ];

  # Module has no tests

  pythonImportsCheck = [ "azure.servicemanagement" ];

  meta = {
    description = "This is the Microsoft Azure Service Management Legacy Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/core/azure-servicemanagement-legacy";
    license = lib.licenses.mit;
  };
})
