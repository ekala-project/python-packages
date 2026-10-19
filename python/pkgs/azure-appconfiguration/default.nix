{
  lib,
  azure-core,
  buildPythonPackage,
  fetchPypi,
  isodate,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-appconfiguration";
  version = "1.9.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_appconfiguration";
    inherit (finalAttrs) version;
    hash = "sha256-OZZ39WNI6RB9epen5H22cjx9LGF/7b6miB7ae47tmVs=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-core
    isodate
  ];

  # Tests are not shipped

  pythonImportsCheck = [ "azure.appconfiguration" ];

  meta = {
    description = "Microsoft App Configuration Data Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/master/sdk/appconfiguration/azure-appconfiguration";
    license = lib.licenses.mit;
  };
})
