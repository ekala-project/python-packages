{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  # dependencies
  distutils,
  h5py,
  numpy,
  qtpy,
  requests,
  tomli,
  # passthru.tests
  guidata,
}:

buildPythonPackage rec {
  pname = "guidata";
  version = "3.14.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "PlotPyStack";
    repo = "guidata";
    tag = "v${version}";
    hash = "sha256-iUfZX51Ef1PY7roy9ER8hG34BAhCLs3Sagoasd5BT3E=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    distutils
    h5py
    numpy
    qtpy
    requests
    tomli
  ];

  pythonImportsCheck = [ "guidata" ];

  meta = {
    description = "Python library generating graphical user interfaces for easy dataset editing and display";
    homepage = "https://github.com/PlotPyStack/guidata";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
