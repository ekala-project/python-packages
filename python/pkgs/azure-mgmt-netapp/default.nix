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
  version = "17.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_netapp";
    inherit (finalAttrs) version;
    hash = "sha256-jXBscRooEYNdamc93XITI+RB6RhCpWP+F7A2CM67h/o=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    isodate
  ];

  # no tests included
  doCheck = false;

  pythonImportsCheck = [
    "azure.common"
    "azure.mgmt.netapp"
  ];

  meta = {
    description = "Microsoft Azure NetApp Files Management Client Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
