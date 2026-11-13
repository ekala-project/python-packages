{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  msrest,
  msrestazure,
  azure-common,
  azure-mgmt-core,
  azure-mgmt-nspkg,
  isPy3k,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-rdbms";
  version = "10.1.1";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_rdbms";
    inherit (finalAttrs) version;
    hash = "sha256-ljRVrODWVm0pmCZxPlTtj6h6iP7GRn6P05Mjh8oKLow=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    msrest
    msrestazure
  ]
  ++ lib.optionals (!isPy3k) [ azure-mgmt-nspkg ];

  # has no tests
  pythonImportsCheck = [ "azure.mgmt.rdbms" ];

  meta = {
    description = "This is the Microsoft Azure RDBMS Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
