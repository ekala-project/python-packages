{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  azure-mgmt-core,
  msrest,
  msrestazure,
  azure-common,
  azure-mgmt-nspkg,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-machinelearningcompute";
  version = "1.0.0b2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    extension = "zip";
    hash = "sha256-ZVJgR1pHQlb54nOJMZ8LMQRMjUS8HRYbg8KWsm2iPms=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-mgmt-core
    msrest
    msrestazure
    azure-common
    azure-mgmt-nspkg
  ];

  # has no tests

  meta = {
    description = "This is the Microsoft Azure Machine Learning Compute Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
