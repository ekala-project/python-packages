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
  pname = "azure-mgmt-security";
  version = "8.0.0b2";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_security";
    inherit (finalAttrs) version;
    hash = "sha256-jpPzkjW9KqYTToENkkm/ZslMVSQTJ0eIatRgPhuqk3o=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    isodate
  ];

  # no tests included

  pythonImportsCheck = [
    "azure.common"
    "azure.mgmt.security"
  ];

  meta = {
    description = "Microsoft Azure Security Center Management Client Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/security/azure-mgmt-security";
    license = lib.licenses.mit;
  };
})
