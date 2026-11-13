{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  msrest,
  msrestazure,
  azure-common,
  azure-mgmt-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-containerinstance";
  version = "10.2.0b2";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_containerinstance";
    inherit (finalAttrs) version;
    hash = "sha256-Iw7ruTV1/8Zy2LEIg27IscLMMbDvURQPOJPREYvw9tI=";
  };

  build-system = [ setuptools ];

  dependencies = [
    msrest
    msrestazure
    azure-common
    azure-mgmt-core
  ];

  # has no tests

  pythonImportsCheck = [ "azure.mgmt.containerinstance" ];

  meta = {
    description = "This is the Microsoft Azure Container Instance Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
