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
  pname = "azure-mgmt-policyinsights";
  version = "1.1.0b6";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_policyinsights";
    inherit (finalAttrs) version;
    hash = "sha256-Dp3LGzQ84guvaHSLXgyiJ9mIk5D6dnq2Pjp/MiDjzc0=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    isodate
    typing-extensions
  ];

  # has no tests
  doCheck = false;

  pythonImportsCheck = [ "azure.mgmt.policyinsights" ];

  meta = {
    description = "Microsoft Azure Policy Insights Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/policyinsights/azure-mgmt-policyinsights";
    license = lib.licenses.mit;
  };
})
