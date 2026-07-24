{
  lib,
  azure-common,
  azure-core,
  buildPythonPackage,
  fetchPypi,
  msrest,
  setuptools,
}:

buildPythonPackage rec {
  pname = "azure-synapse-spark";
  version = "0.7.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-hvopRjokt8NwJf8hUJtw42tNrOKOXZIAG8kgSINQrNU=";
    extension = "zip";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-core
    msrest
  ];

  pythonImportsCheck = [ "azure.synapse.spark" ];

  meta = {
    description = "Microsoft Azure Synapse Spark Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/synapse/azure-synapse-spark";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
