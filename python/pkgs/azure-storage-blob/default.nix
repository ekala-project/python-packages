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
  pname = "azure-storage-blob";
  version = "12.30.1";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_storage_blob";
    inherit version;
    hash = "sha256-eiT5eMUdVqA3W+6//L6EU+Wa45DSaVcFhI7cdQg+QYQ=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-core
    cryptography
    isodate
    typing-extensions
  ];

  # Module has no tests
  doCheck = false;

  meta = {
    description = "Client library for Microsoft Azure Storage services containing the blob service APIs";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
}
