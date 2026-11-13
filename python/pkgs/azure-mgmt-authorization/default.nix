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
  pname = "azure-mgmt-authorization";
  version = "5.0.0b2";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_authorization";
    inherit (finalAttrs) version;
    hash = "sha256-/Y8IT4rjuWyXC0pPAtnem9VbYMSf2PIGVf30sTESnFc=";
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

  pythonImportsCheck = [ "azure.mgmt.authorization" ];

  meta = {
    description = "This is the Microsoft Azure Authorization Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
