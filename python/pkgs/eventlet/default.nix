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
  version = "0.41.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-chuGt3/KM6c1WYKSAirG/u+ZdHv0j1Le/a2mtXKs1a8=";
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
