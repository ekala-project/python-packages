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
  pname = "azure-mgmt-privatedns";
  version = "2.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_privatedns";
    inherit (finalAttrs) version;
    hash = "sha256-4GTSIhFTgkk8dr4QluTYMA6zGp70XBmKoZGZM8uQoSQ=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    isodate
    typing-extensions
  ];

  # no tests included

  pythonImportsCheck = [
    "azure.common"
    "azure.mgmt.privatedns"
  ];

  meta = {
    description = "Microsoft Azure DNS Private Zones Client Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/network/azure-mgmt-privatedns";
    license = lib.licenses.mit;
  };
})
