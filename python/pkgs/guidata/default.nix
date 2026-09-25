{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  # dependencies
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
  version = "3.15.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "PlotPyStack";
    repo = "guidata";
    tag = "v${version}";
    hash = "sha256-u9iT19xQRQ6vw7tJW9Wr7geYAGdBTDisvsE0pq9jZlo=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
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
  };
}
