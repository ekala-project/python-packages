{
  lib,
  aesedb,
  aiosmb,
  aiowinreg,
  buildPythonPackage,
  fetchPypi,
  minidump,
  minikerberos,
  msldap,
  setuptools,
  winsspi,
}:

buildPythonPackage rec {
  pname = "pypykatz";
  version = "0.6.13";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-+T1E/Dk4OcXa8vBhspuB/8V23TORsXXetZpylW25SJM=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aesedb
    aiosmb
    aiowinreg
    minikerberos
    msldap
    winsspi
    minidump
  ];

  # Project doesn't have tests
  pythonImportsCheck = [ "pypykatz" ];

  meta = {
    description = "Mimikatz implementation in Python";
    homepage = "https://github.com/skelsec/pypykatz";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "pypykatz";
  };
}
