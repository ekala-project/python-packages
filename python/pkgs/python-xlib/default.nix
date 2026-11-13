{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools_80,
  setuptools-scm,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-xlib";
  version = "0.33";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-Va95BqLHXObLKApYR3YIBgJET3WBWnr/TSh7stcBizI=";
  };

  build-system = [
    setuptools_80 # setup.py imports pkg_resources
    setuptools-scm
  ];

  dependencies = [ six ];

  pythonImportsCheck = [ "Xlib" ];

  meta = {
    description = "Fully functional X client library for Python programs";
    homepage = "https://github.com/python-xlib/python-xlib";
    license = lib.licenses.lgpl21Plus;
  };
})
