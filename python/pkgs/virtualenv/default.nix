{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatchling,
  hatch-vcs,

  # dependencies
  distlib,
  filelock,
  platformdirs,
}:

buildPythonPackage rec {
  pname = "virtualenv";
  version = "20.36.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-i++1yBhCxkH47mWEgeQmQcaLXqs1IdjgktGDIJAkZro=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    distlib
    filelock
    platformdirs
  ];

  doCheck = false;

  pythonImportsCheck = [ "virtualenv" ];

  meta = {
    description = "Tool to create isolated Python environments";
    homepage = "https://github.com/pypa/virtualenv";
    license = lib.licenses.mit;
    mainProgram = "virtualenv";
  };
}
