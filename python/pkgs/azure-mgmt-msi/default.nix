{
  lib,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  isodate,
  setuptools,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "azure-mgmt-msi";
  version = "8.0.0b2";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_msi";
    inherit version;
    hash = "sha256-9m+tyMcIw94Lhn2UFsVaTcjgUD9dPEE374vE8DlPQDs=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-mgmt-core
    isodate
    typing-extensions
  ];

  pythonNamespaces = [ "azure.mgmt" ];

  # has no tests
  doCheck = false;

  pythonImportsCheck = [ "azure.mgmt.msi" ];

  meta = {
    description = "This is the Microsoft Azure MSI Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/resources/azure-mgmt-msi";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
