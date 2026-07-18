{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "simpy";
  version = "4.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-BtB1CniEsR4OjiDOC8fG1O1fF0PUVmlTQNE/3/lQAaY=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "simpy" ];

  meta = {
    description = "Process-based discrete-event simulation framework based on standard Python";
    homepage = "https://simpy.readthedocs.io/";
    license = lib.licenses.mit;
  };
}
