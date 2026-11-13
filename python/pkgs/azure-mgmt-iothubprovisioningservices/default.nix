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
  pname = "azure-mgmt-iothubprovisioningservices";
  version = "2.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_iothubprovisioningservices";
    inherit (finalAttrs) version;
    hash = "sha256-OWJanx3tLcy4jGBonQJl8mLqf8/dhiJJdWI2yWtW2T4=";
  };

  build-system = [ setuptools ];

  dependencies = [
    msrest
    msrestazure
    azure-common
    azure-mgmt-core
    azure-mgmt-nspkg
  ];

  pythonNamespaces = [ "azure.mgmt" ];

  # has no tests

  pythonImportsCheck = [ "azure.mgmt.iothubprovisioningservices" ];

  meta = {
    description = "This is the Microsoft Azure IoTHub Provisioning Services Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
