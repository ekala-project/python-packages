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
  version = "7.14.3";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_servicebus";
    inherit version;
    hash = "sha256-cKYzhFV67AvucndA57Jd7Snp5wG3dhF2RXf9dAI4lAI=";
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
