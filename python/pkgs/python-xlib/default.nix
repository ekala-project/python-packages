{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  six,
}:

buildPythonPackage rec {
  pname = "python-xlib";
  version = "0.33";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Va95BqLHXObLKApYR3YIBgJET3WBWnr/TSh7stcBizI=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ six ];

  doCheck = false;

  pythonImportsCheck = [ "Xlib" ];

  meta = {
    description = "Fully functional X client library for Python programs";
    homepage = "https://github.com/python-xlib/python-xlib";
    license = lib.licenses.lgpl21Plus;
  };
}
