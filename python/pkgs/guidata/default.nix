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

buildPythonPackage (finalAttrs: {
  pname = "guidata";
  version = "3.17.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "PlotPyStack";
    repo = "guidata";
    tag = "v${finalAttrs.version}";
    hash = "sha256-R9CPpH7rgIBgs1WS7RjxNSfRXeVQi8MJItYRF0WfLUg=";
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
})
