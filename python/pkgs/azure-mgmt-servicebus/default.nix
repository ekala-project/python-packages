{
  lib,
  buildPythonPackage,
  fetchPypi,
  msrest,
  azure-common,
  azure-mgmt-core,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-servicebus";
  version = "10.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_servicebus";
    inherit (finalAttrs) version;
    hash = "sha256-PYeohgtyQ3WXwz36sDYPtLd2pnjHD9aL0qqdAIU+dpg=";
  };

  build-system = [ setuptools ];

  dependencies = [
    msrest
    azure-common
    azure-mgmt-core
  ];

  # Module has no tests

  pythonNamespaces = [ "azure.mgmt" ];

  pythonImportsCheck = [ "azure.mgmt.servicebus" ];

  meta = {
    description = "This is the Microsoft Azure Service Bus Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
