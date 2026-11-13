{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  msrest,
  msrestazure,
  azure-common,
  azure-mgmt-core,
  azure-mgmt-nspkg,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-devspaces";
  version = "1.0.0b3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-ZYYTEWZKEC8lb3rX0jGX/gU5BNIIvYBtodw/rRY+dfc=";
  };

  build-system = [ setuptools ];

  dependencies = [
    msrest
    msrestazure
    azure-common
    azure-mgmt-core
    azure-mgmt-nspkg
  ];

  # has no tests

  pythonImportsCheck = [ "azure.mgmt.devspaces" ];

  meta = {
    description = "This is the Microsoft Azure Dev Spaces Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
