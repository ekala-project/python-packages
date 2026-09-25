{
  lib,
  azure-common,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  isodate,
  msrest,
  setuptools,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "azure-mgmt-eventgrid";
  version = "10.5.0b2";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_eventgrid";
    inherit version;
    hash = "sha256-Dtsm4wB48QRsCNtGcXW4284Ju9j2TW1C9GTxzfBmf4w=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    isodate
    msrest
    typing-extensions
  ];

  # has no tests
  doCheck = false;

  pythonImportsCheck = [ "azure.mgmt.eventgrid" ];

  meta = {
    description = "This is the Microsoft Azure EventGrid Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/eventgrid/azure-mgmt-eventgrid";
    license = lib.licenses.mit;
  };
}
