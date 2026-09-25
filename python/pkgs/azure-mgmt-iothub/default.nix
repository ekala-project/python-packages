{
  lib,
  azure-common,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  isodate,
  setuptools,
}:

buildPythonPackage rec {
  pname = "azure-mgmt-iothub";
  version = "5.0.0b4";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_iothub";
    inherit version;
    hash = "sha256-bRyfCFbJNB4yRr3hr0D+hwdxkc6QF5eO7DH0L9jsHuY=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    isodate
  ];

  # Module has no tests
  doCheck = false;

  pythonImportsCheck = [ "azure.mgmt.iothub" ];

  meta = {
    description = "This is the Microsoft Azure IoTHub Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/iothub/azure-mgmt-iothub";
    license = lib.licenses.mit;
  };
}
