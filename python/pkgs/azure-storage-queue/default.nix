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
  pname = "azure-storage-queue";
  version = "12.18.1";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_storage_queue";
    inherit (finalAttrs) version;
    hash = "sha256-7VKTGp+/8Tg6GY0tkLlpJTWjHgM5GTzP1ap1zcGAjR0=";
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

  # has no tests

  pythonImportsCheck = [ "azure.storage.queue" ];

  meta = {
    description = "Client library for Microsoft Azure Storage services containing the queue service APIs";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
