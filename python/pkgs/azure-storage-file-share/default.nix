{
  lib,
  azure-core,
  buildPythonPackage,
  cryptography,
  fetchPypi,
  isodate,
  setuptools,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-storage-file-share";
  version = "12.27.1";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_storage_file_share";
    inherit (finalAttrs) version;
    hash = "sha256-vJcP6zuPpOOBlE3lFszqaX2T4ghnhAd15NwG/JFdCvE=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-core
    cryptography
    isodate
    typing-extensions
  ];

  optional-dependencies = {
    aio = [ azure-core ] ++ azure-core.optional-dependencies.aio;
  };

  # Tests require checkout from monorepo

  pythonImportsCheck = [
    "azure.core"
    "azure.storage"
  ];

  meta = {
    description = "Microsoft Azure File Share Storage Client Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/storage/azure-storage-file-share";
    license = lib.licenses.mit;
  };
})
