{
  lib,
  buildPythonPackage,
  fetchPypi,
  azure-common,
  azure-mgmt-core,
  isodate,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-netapp";
  version = "18.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_netapp";
    inherit (finalAttrs) version;
    hash = "sha256-lwzSZeJ9WCgDFLsSAgbiqFWb4JWhXzgLuSbuLBcCA14=";
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
    "azure.mgmt.netapp"
  ];

  meta = {
    description = "Microsoft Azure NetApp Files Management Client Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
