{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  jaraco-functools,
  more-itertools,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "cheroot";
  version = "11.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-v7cMSWY/Y7BEDytU28aw0WUOVt/k4mQfWbLG9ye0Sso=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    jaraco-functools
    more-itertools
    six
  ];

  pythonImportsCheck = [ "cheroot" ];

  meta = {
    homepage = "https://github.com/cherrypy/cheroot";
    description = "High-performance, pure-Python HTTP";
    mainProgram = "cheroot";
    license = lib.licenses.mit;
  };
})
