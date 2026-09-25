{
  lib,
  buildPythonPackage,
  fetchPypi,
  isodate,
  azure-common,
  azure-mgmt-core,
  setuptools,
}:

buildPythonPackage rec {
  pname = "azure-mgmt-applicationinsights";
  version = "5.0.0b2";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_applicationinsights";
    inherit version;
    hash = "sha256-JffPFxZQg/yYh0wJ71VKt+ibT87VWV0U08pUlSXg5HY=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    isodate
  ];

  pythonNamespaces = [ "azure.mgmt" ];

  # has no tests
  doCheck = false;

  meta = {
    description = "This is the Microsoft Azure Application Insights Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/applicationinsights/azure-mgmt-applicationinsights";
    license = lib.licenses.mit;
  };
}
