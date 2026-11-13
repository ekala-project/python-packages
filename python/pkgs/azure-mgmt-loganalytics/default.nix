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
  pname = "azure-mgmt-loganalytics";
  version = "14.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_loganalytics";
    inherit (finalAttrs) version;
    hash = "sha256-IA7Mh0S2FsZ7QKLjnRGDGgYGAh24oZnHm/wkb4gGrTU=";
  };

  build-system = [ setuptools ];

  dependencies = [
    msrest
    msrestazure
    azure-common
    azure-mgmt-core
  ];

  pythonNamespaces = [ "azure.mgmt" ];

  # has no tests

  pythonImportsCheck = [ "azure.mgmt.loganalytics" ];

  meta = {
    description = "This is the Microsoft Azure Log Analytics Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
