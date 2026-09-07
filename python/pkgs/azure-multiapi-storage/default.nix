{
  lib,
  azure-common,
  azure-core,
  buildPythonPackage,
  cryptography,
  fetchPypi,
  msrest,
  requests,
  setuptools,
  python-dateutil,
}:

buildPythonPackage rec {
  pname = "azure-multiapi-storage";
  version = "1.7.0b1";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_multiapi_storage";
    inherit version;
    hash = "sha256-yM6mFM2XBkar1KUxsEzKs4h/OK8jFrYlUWH/S/gpn1w=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-core
    cryptography
    msrest
    requests
    python-dateutil
  ];

  # fix namespace
  pythonNamespaces = [ "azure.multiapi" ];

  # no tests included
  doCheck = false;

  pythonImportsCheck = [
    "azure.multiapi.storagev2"
  ];

  meta = {
    description = "Microsoft Azure Storage Client Library for Python with multi API version support";
    homepage = "https://github.com/Azure/azure-multiapi-storage-python";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
