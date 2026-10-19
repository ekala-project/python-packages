{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  msrestazure,
  azure-common,
  azure-mgmt-datalake-nspkg,
  azure-mgmt-core,
}:

buildPythonPackage rec {
  pname = "azure-mgmt-datalake-store";
  version = "1.1.0b1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    hash = "sha256-WidXaLwb2RjKoOZd+brii3Tm/fPcnqfiSu11/7SZy2Q=";
  };

  build-system = [ setuptools ];

  dependencies = [
    msrestazure
    azure-common
    azure-mgmt-core
    azure-mgmt-datalake-nspkg
  ];

  pythonNamespaces = [ "azure.mgmt.datalake" ];

  # has no tests

  meta = {
    description = "This is the Microsoft Azure Data Lake Store Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
}
