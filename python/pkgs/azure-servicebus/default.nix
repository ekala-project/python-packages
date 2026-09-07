{
  lib,
  azure-core,
  buildPythonPackage,
  fetchPypi,
  isodate,
  typing-extensions,
  setuptools,
}:

buildPythonPackage rec {
  pname = "azure-servicebus";
  version = "7.15.0b2";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_servicebus";
    inherit version;
    hash = "sha256-HsPFicWRz7UfBuWDKT5+D6OxxJ1snBXY9qie7cvFZF8=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-core
    isodate
    typing-extensions
  ];

  # Tests require dev-tools
  doCheck = false;

  pythonImportsCheck = [ "azure.servicebus" ];

  meta = {
    description = "Microsoft Azure Service Bus Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/servicebus/azure-servicebus";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
