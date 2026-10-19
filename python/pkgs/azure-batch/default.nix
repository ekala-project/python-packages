{
  lib,
  buildPythonPackage,
  fetchPypi,
  msrestazure,
  azure-common,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-batch";
  version = "14.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-x5Jn1sPT/hShakIqtbv6vL1o7QtYtrvN+gyDRcTHhTI=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [
    azure-common
    msrestazure
  ];

  # Module has no tests

  pythonImportsCheck = [ "azure.batch" ];

  meta = {
    description = "This is the Microsoft Azure Batch Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/batch/azure-batch";
    license = lib.licenses.mit;
  };
})
