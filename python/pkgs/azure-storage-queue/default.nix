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

buildPythonPackage rec {
  pname = "azure-storage-queue";
  version = "12.15.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_storage_queue";
    inherit version;
    hash = "sha256-TgHcrlrv0MRj97rlx1yKkflVyJPxTtdZD8DNRHrEZm0=";
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
  doCheck = false;

  pythonImportsCheck = [ "azure.storage.queue" ];

  meta = {
    description = "Client library for Microsoft Azure Storage services containing the queue service APIs";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
