{
  lib,
  azure-common,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  isodate,
  setuptools,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "azure-mgmt-dns";
  version = "10.0.0b1";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_dns";
    inherit version;
    hash = "sha256-4mYqKLWRN2tZbFvylNJHSw84ThOSf+8cx2jfbUe7vpQ=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    isodate
    typing-extensions
  ];

  # this is still needed for when the version is overrided
  pythonNamespaces = [ "azure.mgmt" ];

  # Tests are only available in the mono-repo
  doCheck = false;

  meta = {
    description = "This is the Microsoft Azure DNS Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/network/azure-mgmt-dns";
    license = lib.licenses.mit;
  };
}
