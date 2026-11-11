{
  lib,
  azure-common,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  msrest,
  msrestazure,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-sqlvirtualmachine";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_sqlvirtualmachine";
    inherit (finalAttrs) version;
    hash = "sha256-oYMLN0Z96G5733OeqFUPXSAw69R+O0CNYhojl8x02RU=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    msrest
    msrestazure
  ];

  # no tests included

  pythonImportsCheck = [
    "azure.common"
    "azure.mgmt.sqlvirtualmachine"
  ];

  meta = {
    description = "Microsoft Azure SQL Virtual Machine Management Client Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/sql/azure-mgmt-sqlvirtualmachine";
    license = lib.licenses.mit;
  };
})
