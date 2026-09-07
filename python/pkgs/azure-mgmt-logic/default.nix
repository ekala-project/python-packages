{
  lib,
  buildPythonPackage,
  fetchPypi,
  msrest,
  azure-common,
  azure-mgmt-core,
  setuptools,
}:

buildPythonPackage rec {
  pname = "azure-mgmt-logic";
  version = "10.1.0b1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    hash = "sha256-WCuNRE7pjNmecva6IE7Oez1KiQuMSWtRBC2ktzPWQk4=";
  };

  build-system = [ setuptools ];

  dependencies = [
    msrest
    azure-common
    azure-mgmt-core
  ];

  # Module has no tests
  doCheck = false;

  pythonNamespaces = [ "azure.mgmt" ];

  pythonImportsCheck = [ "azure.mgmt.logic" ];

  meta = {
    description = "This is the Microsoft Azure Logic Apps Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
