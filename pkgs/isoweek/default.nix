{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "isoweek";
  version = "1.3.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-c/P3usRD4Fo6tFwypyBIsMTybVPYFGLsSxQsdYHT/+g=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "isoweek" ];

  meta = {
    description = "Module to work with ISO weeks";
    homepage = "https://github.com/gisle/isoweek";
    license = lib.licenses.bsd2;
  };
}
