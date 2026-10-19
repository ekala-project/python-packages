{
  lib,
  buildPythonPackage,
  fetchPypi,
  isPyPy,

  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "babel";
  version = "2.18.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-uAuZoUvQhfys+hXJFl9lH7s0BuZsxgOr8RxXUJN8mS0=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "babel" ];

  meta = {
    description = "Collection of internationalizing tools";
    homepage = "https://babel.pocoo.org/";
    license = lib.licenses.bsd3;
    mainProgram = "pybabel";
  };
})
