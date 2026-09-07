{
  lib,
  azure-common,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  isodate,
  setuptools,
}:

buildPythonPackage rec {
  pname = "azure-mgmt-search";
  version = "10.0.0b1";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_search";
    inherit version;
    hash = "sha256-mtiAjukojtK5hqYfmzTNz142ul6R6qPbfQ5mQpvtsaQ=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    isodate
  ];

  # Module has no tests
  doCheck = false;

  pythonImportsCheck = [ "azure.mgmt.search" ];

  meta = {
    description = "This is the Microsoft Azure Search Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
