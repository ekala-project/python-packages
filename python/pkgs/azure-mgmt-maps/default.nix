{
  lib,
  azure-common,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  isodate,
  msrest,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-maps";
  version = "3.0.0b1";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_maps";
    inherit (finalAttrs) version;
    hash = "sha256-IIKvonwqwhGXmxLcsferztUKPgFxI6qAVEGhblq2WgE=";
  };

  build-system = [ setuptools ];

  dependencies = [
    isodate
    azure-common
    azure-mgmt-core
    msrest
  ];

  pythonNamespaces = [ "azure.mgmt" ];

  # Module has no tests

  pythonImportsCheck = [ "azure.mgmt.maps" ];

  meta = {
    description = "This is the Microsoft Azure Maps Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
