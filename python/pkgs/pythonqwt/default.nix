{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  setuptools
, # dependencies
  numpy
, qtpy
,
}:

buildPythonPackage rec {
  pname = "pythonqwt";
  version = "0.16.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "PlotPyStack";
    repo = "PythonQwt";
    tag = "v${version}";
    hash = "sha256-uCCbKlyqeXUcmFYz/0b/+vpL7vivO8qn0L2PHgfN1H8=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    qtpy
    numpy
  ];
  pythonImportsCheck = [ "qwt" ];

  meta = {
    description = "Qt plotting widgets for Python (pure Python reimplementation of Qwt C++ library)";
    homepage = "https://github.com/PlotPyStack/PythonQwt";
    license = lib.licenses.lgpl21Only;
    maintainers = [ ];
  };
}
