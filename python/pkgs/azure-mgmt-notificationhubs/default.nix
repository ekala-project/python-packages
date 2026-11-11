{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  msrest,
  msrestazure,
  azure-common,
  azure-mgmt-core,
  azure-mgmt-nspkg,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-notificationhubs";
  version = "8.1.0b3";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_notificationhubs";
    inherit (finalAttrs) version;
    hash = "sha256-zehcshDcg1SsC4rTHhr09xlM3uHSQC0OWFFfcwZwqdU=";
  };

  build-system = [ setuptools ];

  dependencies = [
    msrest
    msrestazure
    azure-common
    azure-mgmt-core
    azure-mgmt-nspkg
  ];

  # has no tests

  pythonImportsCheck = [ "azure.mgmt.notificationhubs" ];

  meta = {
    description = "This is the Microsoft Azure Notification Hubs Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
