{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "geojson";
  version = "3.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-kug7nLN4pFC0LxIHu5sqAx+fyJGF8zUVPEQ2m4uLcf0=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "geojson" ];

  meta = {
    homepage = "https://github.com/jazzband/geojson";
    description = "Python bindings and utilities for GeoJSON";
    license = lib.licenses.bsd3;
  };
})
