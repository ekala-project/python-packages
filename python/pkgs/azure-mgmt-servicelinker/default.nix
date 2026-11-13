{
  lib,
  buildPythonPackage,
  fetchPypi,
  azure-common,
  azure-mgmt-core,
  msrest,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-servicelinker";
  version = "1.2.0b3";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_servicelinker";
    inherit (finalAttrs) version;
    hash = "sha256-xRwRH7dsWeWPzsz+z9EZ+Mg+TWT9yneka2LYHsaj6ik=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    msrest
  ];

  pythonImportsCheck = [ "azure.mgmt.servicelinker" ];

  # no tests with sdist

  meta = {
    description = "Microsoft Azure Servicelinker Management Client Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
