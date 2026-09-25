{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  msrestazure,
  azure-common,
  azure-mgmt-core,
  azure-mgmt-datalake-nspkg,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-datalake-analytics";
  version = "1.0.0b2";
  pyproject = true;

  __structuredAttrs = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    extension = "zip";
    hash = "sha256-TPj9zftR4m+yB+1BFJBFNN+sYBJT2NpwHG6SZzAQv5U=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    azure-mgmt-datalake-nspkg
    msrestazure
  ];

  pythonNamespaces = [ "azure.mgmt.datalake" ];

  # has no tests
  doCheck = false;

  pythonImportsCheck = [ "azure.mgmt.datalake.analytics" ];

  meta = {
    description = "This is the Microsoft Azure Data Lake Analytics Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
