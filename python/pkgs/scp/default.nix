{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  paramiko,
}:

buildPythonPackage rec {
  pname = "scp";
  version = "0.16.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-F2OkuKxCTqDDBPWLlaSkpR1QOoNO13tOifGjKzDL5mI=";
  };

  build-system = [ setuptools ];

  dependencies = [ paramiko ];

  pythonImportsCheck = [ "scp" ];

  meta = {
    homepage = "https://github.com/jbardin/scp.py";
    description = "SCP module for paramiko";
    license = lib.licenses.lgpl21Only;
  };
}
