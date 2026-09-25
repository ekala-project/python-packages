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

buildPythonPackage rec {
  pname = "azure-mgmt-hybridcompute";
  version = "10.0.0";
  format = "wheel";

  src = fetchPypi {
    pname = "azure_mgmt_hybridcompute";
    inherit version;
    format = "wheel";
    python = "py3";
    dist = "py3";
    hash = "sha256-XRCJM+DHVPOvhpOq4J6JjbPPkTBOuQ/9C9DxcTWCIWs=";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-core
    isodate
    typing-extensions
  ];

  # Module has no tests
  doCheck = false;

  pythonImportsCheck = [ "azure.mgmt.hybridcompute" ];

  meta = {
    description = "Microsoft Azure Hybrid Compute Management Client Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
}
