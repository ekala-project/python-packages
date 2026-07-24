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

buildPythonPackage rec {
  pname = "eventlet";
  version = "0.41.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-6RAQyqGIC7UR3mzi7SGG7zST4HYqTT7pPpeg/Mzaqig=";
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

  doCheck = false;

  pythonImportsCheck = [ "eventlet" ];

  meta = {
    description = "Concurrent networking library for Python";
    homepage = "https://github.com/eventlet/eventlet/";
    license = lib.licenses.mit;
  };
}
