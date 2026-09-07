{
  lib,
  azure-common,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  isodate,
  setuptools,
}:

buildPythonPackage rec {
  pname = "azure-mgmt-frontdoor";
  version = "2.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_frontdoor";
    inherit version;
    hash = "sha256-YsYB33KB+EpIvKtADTn6sQ0Tr8NsJ/q3LsFa1e/yGQk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    isodate
  ];

  # Tests are only available in mono repo
  doCheck = false;

  pythonImportsCheck = [ "azure.mgmt.frontdoor" ];

  meta = {
    description = "Microsoft Azure Front Door Service Client Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/network/azure-mgmt-frontdoor";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
