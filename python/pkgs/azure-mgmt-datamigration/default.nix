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
  pname = "azure-mgmt-datamigration";
  version = "11.0.0b1";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_datamigration";
    inherit version;
    hash = "sha256-m0NOmFDxtl+4my5ztq55XBxbRhMWinKomG5zl5odxLo=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    isodate
    typing-extensions
  ];

  pythonNamespaces = [ "azure.mgmt" ];

  # has no tests
  doCheck = false;

  meta = {
    description = "This is the Microsoft Azure Data Migration Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/datamigration/azure-mgmt-datamigration";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
