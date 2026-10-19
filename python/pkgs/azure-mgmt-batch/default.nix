{
  lib,
  azure-common,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  isodate,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-batch";
  version = "19.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_batch";
    inherit (finalAttrs) version;
    hash = "sha256-J1SD+jlAkzxzwipCtZ0bWwUxkdjwH2wsCa8O71LzGlw=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    isodate
  ];

  # Tests are only available in mono repo

  pythonImportsCheck = [ "azure.mgmt.batch" ];

  meta = {
    description = "This is the Microsoft Azure Batch Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/batch/azure-mgmt-batch";
    license = lib.licenses.mit;
  };
})
