{
  lib,
  azure-common,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  msrest,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-botservice";
  version = "3.0.0b1";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_botservice";
    inherit (finalAttrs) version;
    hash = "sha256-zjf956+s8UkOhJ4H6wz+Jnx7tyJpcqzziMYmYP1o9FE=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    msrest
  ];

  # no tests included

  pythonImportsCheck = [
    "azure.common"
    "azure.mgmt.botservice"
  ];

  meta = {
    description = "Microsoft Azure API Management Client Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/botservice/azure-mgmt-botservice";
    license = lib.licenses.mit;
  };
})
