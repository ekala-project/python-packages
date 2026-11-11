{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  msrest,
  msrestazure,
  azure-common,
  azure-mgmt-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-signalr";
  version = "2.0.0b3";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_signalr";
    inherit (finalAttrs) version;
    hash = "sha256-cgkCvkDQXUihCcBgSJ7BOBQExPO7YQc6Lk+iBXPzSLo=";
  };

  build-system = [ setuptools ];

  dependencies = [
    msrest
    msrestazure
    azure-common
    azure-mgmt-core
  ];

  # has no tests

  pythonImportsCheck = [ "azure.mgmt.signalr" ];

  meta = {
    description = "This is the Microsoft Azure SignalR Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
