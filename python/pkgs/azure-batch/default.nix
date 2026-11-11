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
  version = "15.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_batch";
    inherit (finalAttrs) version;
    hash = "sha256-L2hNF2tFe3ITU14UUYCpFO1oRLLRBm/MIqyIw6yeP6U=";
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
