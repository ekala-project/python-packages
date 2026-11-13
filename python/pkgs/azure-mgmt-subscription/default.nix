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
  pname = "azure-mgmt-subscription";
  version = "3.2.0b2";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_subscription";
    inherit (finalAttrs) version;
    hash = "sha256-OODkCvi06zNe1RdO8CKNId9z0+7wOYVMQ9KAewD7TmM=";
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
  pythonImportsCheck = [ "azure.mgmt.subscription" ];

  meta = {
    description = "This is the Microsoft Azure Subscription Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
