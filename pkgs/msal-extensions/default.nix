{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  msal,
  portalocker,
  setuptools,
}:

buildPythonPackage rec {
  pname = "msal-extensions";
  version = "1.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "AzureAD";
    repo = "microsoft-authentication-extensions-for-python";
    tag = version;
    hash = "sha256-LRopszB8+8N9EajSmZvz0MTomp/qWZ5O3q00AHimZbY=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "portalocker" ];

  dependencies = [
    msal
    portalocker
  ];

  pythonImportsCheck = [ "msal_extensions" ];

  meta = {
    description = "Microsoft Authentication Library Extensions (MSAL-Extensions) for Python";
    homepage = "https://github.com/AzureAD/microsoft-authentication-extensions-for-python";
    license = lib.licenses.mit;
  };
}
