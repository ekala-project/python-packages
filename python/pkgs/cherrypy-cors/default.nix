{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
  httpagentparser,
  cherrypy,
}:

buildPythonPackage rec {
  pname = "cherrypy-cors";
  version = "1.7.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-gzhM1mSnq4uat9SSb+lxOs/gvONmXuKBiaD6BLnyEtY=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    httpagentparser
    cherrypy
  ];

  pythonImportsCheck = [ "cherrypy_cors" ];

  meta = {
    description = "CORS support for CherryPy";
    homepage = "https://github.com/cherrypy/cherrypy-cors";
    license = lib.licenses.mit;
  };
}
