{
  lib,
  buildPythonPackage,
  cython,
  fetchPypi,
  # build-system
  setuptools,
  numpy,
}:

buildPythonPackage (finalAttrs: {
  pname = "cftime";
  version = "1.6.6";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-eycWs9zpe6F0AYnEJM6XvW+OZTkbf+MjxvD4F/aorVY=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [
    cython
    numpy
  ];

  dependencies = [ numpy ];
  pythonImportsCheck = [ "cftime" ];

  meta = {
    description = "Time-handling functionality from netcdf4-python";
    homepage = "https://github.com/Unidata/cftime";
    license = lib.licenses.mit;
  };
})
