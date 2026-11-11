{
  lib,
  azure-common,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  isodate,
  setuptools,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-hybridcompute";
  version = "10.1.0";
  format = "wheel";

  src = fetchPypi {
    pname = "azure_mgmt_hybridcompute";
    inherit (finalAttrs) version;
    format = "wheel";
    python = "py3";
    dist = "py3";
    hash = "sha256-FhpU2WJU6Fvk/W1BaDfOkvJMmNLtGGEh5yQxB36IGOg=";
  };

  dependencies = [
    azure-common
    azure-mgmt-core
    isodate
    typing-extensions
  ];

  # Module has no tests

  pythonImportsCheck = [ "azure.mgmt.hybridcompute" ];

  meta = {
    description = "Microsoft Azure Hybrid Compute Management Client Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
