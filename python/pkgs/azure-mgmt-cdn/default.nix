{
  lib,
  azure-common,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  isodate,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-cdn";
  version = "14.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_cdn";
    inherit (finalAttrs) version;
    hash = "sha256-mYvnfdzBC/n69u7u6uVFR+fjinKr0pCY1rTDJUTX/T8=";
  };

  build-system = [ setuptools ];

  dependencies = [
    isodate
    azure-common
    azure-mgmt-core
  ];

  # has no tests

  pythonImportsCheck = [ "azure.mgmt.cdn" ];

  meta = {
    description = "This is the Microsoft Azure CDN Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
