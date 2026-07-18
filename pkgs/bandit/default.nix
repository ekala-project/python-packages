{
  lib,
  fetchPypi,
  buildPythonPackage,
  pbr,
  setuptools,
  gitpython,
  pyyaml,
  rich,
  stevedore,
}:

buildPythonPackage rec {
  pname = "bandit";
  version = "1.9.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-tYnl3ir+cL1NU/oMHaYZn0CFr2Zv3gDooDTxUqUs1ig=";
  };

  build-system = [
    pbr
    setuptools
  ];

  dependencies = [
    gitpython
    pyyaml
    rich
    stevedore
  ];

  pythonImportsCheck = [ "bandit" ];

  meta = {
    description = "Security oriented static analyser for python code";
    homepage = "https://bandit.readthedocs.io/";
    license = lib.licenses.asl20;
  };
}
