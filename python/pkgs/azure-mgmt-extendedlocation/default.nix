{
  lib,
  azure-common,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  isodate,
  setuptools,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "azure-mgmt-extendedlocation";
  version = "3.0.0b1";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_extendedlocation";
    inherit version;
    hash = "sha256-jO0iYpPCUwReAcdVPtRyhdh2UWK/YsP7fsFYGXX07hg=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    isodate
    typing-extensions
  ];

  # Tests are only available in mono repo
  doCheck = false;

  pythonImportsCheck = [ "azure.mgmt.extendedlocation" ];

  meta = {
    description = "Microsoft Azure Extendedlocation Management Client Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/extendedlocation/azure-mgmt-extendedlocation";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
