{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "policyuniverse";
  version = "1.5.1.20231109";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-dOVtQQVgkVwsUTLjYbATDkv/4xKi9FIw6sUNfAlLxAo=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "policyuniverse" ];

  meta = {
    description = "Parse and Process AWS IAM Policies, Statements, ARNs and wildcards";
    homepage = "https://github.com/Netflix-Skunkworks/policyuniverse";
    license = lib.licenses.asl20;
  };
}
