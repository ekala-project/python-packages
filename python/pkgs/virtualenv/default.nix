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
  python-discovery,
}:

buildPythonPackage rec {
  pname = "virtualenv";
  version = "21.7.9";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-p+Qtgdd53siv19xL5xZA+5WeqGG8z6WYDLStn5LjBnU=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    distlib
    filelock
    platformdirs
    python-discovery
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
