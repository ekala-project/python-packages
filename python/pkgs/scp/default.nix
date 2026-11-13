{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  paramiko,
}:

buildPythonPackage (finalAttrs: {
  pname = "scp";
  version = "0.16.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-0En5qnfbQELES5Is7KvpfvBxb7M0qVcB1o0ceZFoT8I=";
  };

  build-system = [ setuptools ];

  dependencies = [ paramiko ];

  pythonImportsCheck = [ "scp" ];

  meta = {
    homepage = "https://github.com/jbardin/scp.py";
    description = "SCP module for paramiko";
    license = lib.licenses.lgpl21Only;
  };
})
