{
  lib,
  azure-common,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  isodate,
  setuptools,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-network";
  version = "33.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_network";
    inherit (finalAttrs) version;
    hash = "sha256-ykTpWWflML2sMv99fmR2yE6FIiXlquFI7vJpTzT5cQs=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    isodate
    typing-extensions
  ];

  # Module has no tests

  pythonNamespaces = [ "azure.mgmt" ];

  pythonImportsCheck = [ "azure.mgmt.network" ];

  meta = {
    description = "Microsoft Azure SDK for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/network/azure-mgmt-network";
    license = lib.licenses.mit;
  };
})
