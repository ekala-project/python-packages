{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  paramiko,
}:

buildPythonPackage rec {
  pname = "scp";
  version = "0.15.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-8bIumTISPM8X7r8Z4JU8bpFI9Yn5PZG4cpQaaWMFyD8=";
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
