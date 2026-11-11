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
  pname = "azure-storage-blob";
  version = "12.31.1";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_storage_blob";
    inherit (finalAttrs) version;
    hash = "sha256-DW5bhgoTV+/GAtsEz6fJlQrIYSbtz324kyDN4oFVX+U=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-core
    cryptography
    isodate
    typing-extensions
  ];

  # Module has no tests

  meta = {
    description = "Client library for Microsoft Azure Storage services containing the blob service APIs";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
