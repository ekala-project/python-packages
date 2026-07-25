{
  lib,
  azure-core,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "azure-eventhub";
  version = "5.15.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Azure";
    repo = "azure-sdk-for-python";
    tag = "azure-eventhub_${version}";
    hash = "sha256-zpj1DUeFCXgVw44LcBCYtuFcQtA9BnrDKAxKSYzu4ts=";
  };

  sourceRoot = "${src.name}/sdk/eventhub/azure-eventhub";

  build-system = [ setuptools ];

  dependencies = [
    azure-core
    typing-extensions
  ];

  # too complicated to set up
  pythonImportsCheck = [
    "azure.eventhub"
    "azure.eventhub.aio"
  ];

  passthru = {
  };

  meta = {
    description = "Microsoft Azure Event Hubs Client Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/master/sdk/eventhub/azure-eventhub";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
