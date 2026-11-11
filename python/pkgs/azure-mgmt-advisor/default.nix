{
  lib,
  azure-common,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  msrest,
  msrestazure,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-advisor";
  version = "9.0.1";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_advisor";
    inherit (finalAttrs) version;
    hash = "sha256-FmpZu8F0mePFoASnCYjDC3BoitTdAyg/8Gh8ijh+8nk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    msrest
    msrestazure
    azure-common
    azure-mgmt-core
  ];

  # Module has no tests

  meta = {
    description = "This is the Microsoft Azure Advisor Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
