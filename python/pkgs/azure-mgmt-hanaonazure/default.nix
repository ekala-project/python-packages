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
  pname = "azure-mgmt-hanaonazure";
  version = "1.0.1";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_hanaonazure";
    inherit (finalAttrs) version;
    hash = "sha256-kJb/Z0sKo52A4usdZaMot5OgdrxlODV6KyKuVrSs6GQ=";
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

  pythonImportsCheck = [ "azure.mgmt.hanaonazure" ];

  meta = {
    description = "This is the Microsoft Azure SAP Hana on Azure Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
