{
  lib,
  azure-common,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  msrest,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-mgmt-hdinsight";
  version = "9.0.1";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_mgmt_hdinsight";
    inherit (finalAttrs) version;
    hash = "sha256-EUVVmiw+4RQkaSTxpOA125/ACP1xXU3PrjrZgh+Z9Iw=";
  };

  build-system = [ setuptools ];

  dependencies = [
    azure-common
    azure-mgmt-core
    msrest
  ];

  # no tests included

  pythonNamespaces = [ "azure.mgmt" ];

  pythonImportsCheck = [
    "azure.mgmt.hdinsight"
  ];

  meta = {
    description = "Microsoft Azure HDInsight Management Client Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/hdinsight/azure-mgmt-hdinsight";
    license = lib.licenses.mit;
  };
})
