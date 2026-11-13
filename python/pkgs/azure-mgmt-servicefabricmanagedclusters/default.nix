{
  lib,
  azure-common,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  isodate,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-servicefabricmanagedclusters";
  version = "3.1.0b2";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_servicefabricmanagedclusters";
    inherit (finalAttrs) version;
    hash = "sha256-G0B0CzBv43JOMF+2pyfrp7Xy58bbSo6ERmupw5wmBKE=";
  };

  build-system = [ setuptools ];

  dependencies = [
    isodate
    azure-common
    azure-mgmt-core
  ];

  pythonNamespaces = [ "azure.mgmt" ];

  # Module has tests in mono-repo

  meta = {
    description = "This is the Microsoft Azure Service Fabric Cluster Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/servicefabricmanagedclusters/azure-mgmt-servicefabricmanagedclusters";
    license = lib.licenses.mit;
  };
})
