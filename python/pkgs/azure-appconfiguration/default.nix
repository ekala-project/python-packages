{
  lib,
  azure-core,
  buildPythonPackage,
  fetchPypi,
  isodate,
  setuptools,
}:

buildPythonPackage rec {
  pname = "azure-appconfiguration";
  version = "1.7.2";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_appconfiguration";
    inherit version;
    hash = "sha256-zv11spi4mKjtn3MEjz859OgQWaWM2DLQUjeH/B2RKgY=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-core
    isodate
  ];

  # Tests are not shipped
  doCheck = false;

  pythonImportsCheck = [ "azure.appconfiguration" ];

  meta = {
    description = "Microsoft App Configuration Data Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/master/sdk/appconfiguration/azure-appconfiguration";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
