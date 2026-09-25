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
  pname = "azure-mgmt-apimanagement";
  version = "6.0.0b1";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_apimanagement";
    inherit version;
    hash = "sha256-/8ZPGH8pNwd2JLoFxwWelHYa8yyWBfyTRYCJ35duuU8=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    isodate
  ];

  # no tests included
  doCheck = false;

  pythonImportsCheck = [
    "azure.common"
    "azure.mgmt.apimanagement"
  ];

  meta = {
    description = "Microsoft Azure API Management Client Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/apimanagement/azure-mgmt-apimanagement";
    license = lib.licenses.mit;
  };
}
