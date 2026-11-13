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
  pname = "azure-mgmt-servicefabric";
  version = "2.2.0b2";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_servicefabric";
    inherit (finalAttrs) version;
    hash = "sha256-c46H7aPFj0EbqQ0RLfXHnqlJB2g/19PBHt2bXiNtSmk=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [
    isodate
    azure-common
    azure-mgmt-core
  ];

  pythonNamespaces = [ "azure.mgmt" ];

  # Module has no tests

  meta = {
    description = "This is the Microsoft Azure Service Fabric Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/servicefabric/azure-mgmt-servicefabric";
    license = lib.licenses.mit;
  };
})
