{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "rcssmin";
  version = "1.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-/xWjiQ6zUPGqnsNJmPkUxOL7E/lJSW98JegHV4KBrc8=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "rcssmin" ];

  meta = {
    homepage = "http://opensource.perlig.de/rcssmin/";
    description = "CSS minifier written in pure python";
    license = lib.licenses.asl20;
  };
})
