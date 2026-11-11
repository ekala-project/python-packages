{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatch-vcs,
  hatchling,
  dnspython,
  greenlet,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "eventlet";
  version = "0.41.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-ZtGIPydulNBA0AfpnXCF5qpfJzjFuHg9FloTcFDcj7Y=";
  };

  pythonRelaxDeps = [ "greenlet" ];

  build-system = [
    hatch-vcs
    hatchling
  ];

  dependencies = [
    dnspython
    greenlet
    six
  ];

  pythonImportsCheck = [ "eventlet" ];

  meta = {
    description = "Concurrent networking library for Python";
    homepage = "https://github.com/eventlet/eventlet/";
    license = lib.licenses.mit;
  };
})
