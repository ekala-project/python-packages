{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  msrest,
  msrestazure,
  azure-common,
  azure-mgmt-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-media";
  version = "10.2.1";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_media";
    inherit (finalAttrs) version;
    hash = "sha256-1lTc6SqFw66yUafg0MjY+jd9Jq5NOINu9puFybSGkRM=";
  };

  build-system = [ setuptools ];

  dependencies = [
    msrest
    msrestazure
    azure-common
    azure-mgmt-core
  ];

  # has no tests

  pythonImportsCheck = [ "azure.mgmt.media" ];

  meta = {
    description = "This is the Microsoft Azure Media Services Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
