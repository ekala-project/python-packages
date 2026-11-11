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
  pname = "azure-mgmt-consumption";
  version = "11.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_consumption";
    inherit (finalAttrs) version;
    hash = "sha256-ymXXgvG+A6V2D8629Fd7fHBl7N4drGrted9/Hr4bS4o=";
  };

  build-system = [ setuptools ];

  dependencies = [
    msrestazure
    azure-common
    azure-mgmt-core
    azure-mgmt-nspkg
  ];

  preBuild = ''
    rm -f azure_bdist_wheel.py
  '';

  pythonNamespaces = [ "azure.mgmt" ];

  # has no tests

  meta = {
    description = "This is the Microsoft Azure Consumption Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
