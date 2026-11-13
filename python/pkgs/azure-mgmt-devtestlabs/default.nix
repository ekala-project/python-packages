{
  lib,
  buildPythonPackage,
  fetchPypi,
  isPy3k,
  setuptools,
  msrest,
  msrestazure,
  azure-common,
  azure-mgmt-core,
  azure-mgmt-nspkg,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-devtestlabs";
  version = "9.0.1";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_devtestlabs";
    inherit (finalAttrs) version;
    hash = "sha256-wdDN1joIwtp4stF8mFtJCo9dJhfQgi94UzLX2ukYLAM=";
  };

  build-system = [ setuptools ];

  dependencies = [
    msrest
    msrestazure
    azure-common
    azure-mgmt-core
  ]
  ++ lib.optionals (!isPy3k) [ azure-mgmt-nspkg ];

  pythonNamespaces = [ "azure.mgmt" ];

  pythonImportsCheck = [ "azure.mgmt.devtestlabs" ];

  # has no tests

  meta = {
    description = "This is the Microsoft Azure DevTestLabs Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
