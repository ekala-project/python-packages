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
  isPy3k,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-trafficmanager";
  version = "2.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_trafficmanager";
    inherit (finalAttrs) version;
    hash = "sha256-VNkrYIpUHDKkYeYHhMS7wfBOSX+2TrQpxirBirfmzow=";
  };

  build-system = [ setuptools ];

  dependencies = [
    msrest
    msrestazure
    azure-common
    azure-mgmt-core
  ]
  ++ lib.optionals (!isPy3k) [ azure-mgmt-nspkg ];

  # has no tests

  pythonImportsCheck = [ "azure.mgmt.trafficmanager" ];

  meta = {
    description = "This is the Microsoft Azure Traffic Manager Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
