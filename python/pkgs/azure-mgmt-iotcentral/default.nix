{
  lib,
  buildPythonPackage,
  fetchPypi,
  msrest,
  msrestazure,
  azure-common,
  azure-mgmt-core,
  azure-mgmt-nspkg,
  isPy3k,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-iotcentral";
  version = "9.0.1";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_iotcentral";
    inherit (finalAttrs) version;
    hash = "sha256-Q+OYkC1MAMPi9Js4/xQIAXk7chqRguDkyMP+3jZ5hGg=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    msrest
    msrestazure
  ]
  ++ lib.optionals (!isPy3k) [ azure-mgmt-nspkg ];

  # has no tests

  pythonImportsCheck = [ "azure.mgmt.iotcentral" ];

  meta = {
    description = "This is the Microsoft Azure IoTCentral Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
