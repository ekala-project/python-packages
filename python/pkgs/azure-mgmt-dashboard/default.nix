{
  lib,
  azure-common,
  azure-mgmt-core,
  buildPythonPackage,
  fetchPypi,
  isodate,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "azure-mgmt-dashboard";
  version = "2.0.0";
  format = "wheel";

  src = fetchPypi {
    pname = "azure_mgmt_dashboard";
    inherit version;
    format = "wheel";
    python = "py3";
    dist = "py3";
    hash = "sha256-1LASBzs+biyDDQPoCujcvLhK3iyNaHLU8VCtBSdTJxg=";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-core
    isodate
    typing-extensions
  ];

  # Module has no tests
  doCheck = false;

  pythonImportsCheck = [ "azure.mgmt.dashboard" ];

  meta = {
    description = "Microsoft Azure Dashboard Management Client Library for Python";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
