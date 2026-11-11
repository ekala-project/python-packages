{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  azure-common,
  azure-mgmt-core,
  msrest,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-relay";
  version = "2.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_relay";
    inherit (finalAttrs) version;
    sha256 = "sha256-hT/Zy5W4m92ryRWLJ7bJ78pEDWcXW+zeBxidiyveNko=";
  };

  build-system = [ setuptools ];

  dependencies = [
    msrest
    azure-common
    azure-mgmt-core
  ];

  preBuild = ''
    rm -f azure_bdist_wheel.py
  '';

  pythonNamespaces = [ "azure.mgmt" ];

  # has no tests
  pythonImportsCheck = [ "azure.mgmt.relay" ];

  meta = {
    description = "This is the Microsoft Azure Relay Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
