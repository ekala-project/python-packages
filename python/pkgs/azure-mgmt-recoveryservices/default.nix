{
  lib,
  azure-common,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  isodate,
  msrest,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-recoveryservices";
  version = "4.3.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_recoveryservices";
    inherit (finalAttrs) version;
    hash = "sha256-BhQT5yVfOyVIMudXZjwuU5X7/3/u4Uy4jgUjrYpoJ8I=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    isodate
    msrest
  ];

  # Module has no tests

  pythonImportsCheck = [ "azure.mgmt.recoveryservices" ];

  meta = {
    description = "This is the Microsoft Azure Recovery Services Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
