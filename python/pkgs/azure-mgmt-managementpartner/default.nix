{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  msrestazure,
  azure-common,
  azure-mgmt-core,
  azure-mgmt-nspkg,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-managementpartner";
  version = "1.0.1";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_managementpartner";
    inherit (finalAttrs) version;
    hash = "sha256-+VUacBeUTaj34XMAaBWDbS4IU5aGC/gb3SOHXqMUGbc=";
  };

  build-system = [ setuptools ];

  dependencies = [
    msrestazure
    azure-common
    azure-mgmt-core
    azure-mgmt-nspkg
  ];

  # has no tests

  pythonImportsCheck = [ "azure.mgmt.managementpartner" ];

  meta = {
    description = "This is the Microsoft Azure ManagementPartner Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
