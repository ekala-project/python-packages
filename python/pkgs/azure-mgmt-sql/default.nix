{
  lib,
  buildPythonPackage,
  fetchPypi,
  msrest,
  msrestazure,
  azure-common,
  azure-mgmt-core,
  azure-mgmt-nspkg,
  isPy3k,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-sql";
  version = "4.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_sql";
    inherit (finalAttrs) version;
    hash = "sha256-s5dW+c+KzucnZPHHRSEcbGNfpfa/wnF03ipYaQkXJis=";
  };

  build-system = [ setuptools ];

  dependencies = [
    msrest
    msrestazure
    azure-common
    azure-mgmt-core
  ]
  ++ lib.optionals (!isPy3k) [ azure-mgmt-nspkg ];

  # has no tests

  pythonImportsCheck = [ "azure.mgmt.sql" ];

  meta = {
    description = "This is the Microsoft Azure SQL Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
