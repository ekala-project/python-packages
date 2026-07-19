{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
  cython,
}:

buildPythonPackage rec {
  pname = "pyclipper";
  version = "1.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-mIK9iJ8n2nit1N1viB0laX78dAv4QCdOdJmI0lSWyOE=";
  };

  build-system = [
    setuptools
    setuptools-scm
    cython
  ];

  pythonImportsCheck = [ "pyclipper" ];

  meta = {
    description = "Cython wrapper for clipper library";
    homepage = "https://github.com/fonttools/pyclipper";
    license = lib.licenses.mit;
  };
}
