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
  version = "30.2.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_network";
    inherit (finalAttrs) version;
    hash = "sha256-mxfCWeY0SAiqqAo0u8SxPxa8ARhd2dsTfqoK4mZkhho=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    isodate
    typing-extensions
  ];

  # Module has no tests
  doCheck = false;

  pythonNamespaces = [ "azure.mgmt" ];

  pythonImportsCheck = [ "azure.mgmt.network" ];

  meta = {
    description = "Microsoft Azure SDK for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/network/azure-mgmt-network";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
