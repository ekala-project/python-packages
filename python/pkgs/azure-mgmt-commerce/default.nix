{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  msrestazure,
  azure-common,
  azure-mgmt-core,
  azure-mgmt-nspkg,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-commerce";
  version = "6.0.1";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_commerce";
    inherit (finalAttrs) version;
    sha256 = "sha256-5KMvKvaEAgsC4ehH0tlAYE3b1gECYSYsM3kf/Gkv3q4=";
  };

  build-system = [ setuptools ];

  dependencies = [
    msrestazure
    azure-common
    azure-mgmt-core
    azure-mgmt-nspkg
  ];

  prePatch = ''
    rm -f azure_bdist_wheel.py tox.ini
    sed -i "/azure-namespace-package/c\ " setup.cfg
  '';

  pythonNamespaces = [ "azure.mgmt" ];

  # has no tests
  pythonImportsCheck = [ "azure.mgmt.commerce" ];

  meta = {
    description = "This is the Microsoft Azure Commerce Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
  };
})
