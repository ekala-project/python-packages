{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "cssmin";
  version = "0.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-4BLwzIQB788mIDMjOQEVZHOK4yvoyEsuQ86L6uwQZ7Y=";
  };

  build-system = [ setuptools ];

  # no tests

  pythonImportsCheck = [ "cssmin" ];

  meta = {
    description = "Python port of the YUI CSS compression algorithm";
    mainProgram = "cssmin";
    homepage = "https://github.com/zacharyvoase/cssmin";
    license = lib.licenses.bsd3;
  };
}
