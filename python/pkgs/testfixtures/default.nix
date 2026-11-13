{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "testfixtures";
  version = "12.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-zAEIYU+IrOiBe1h76gZhW90iX+w5LtPeivq/9dHvIcc=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "testfixtures" ];

  meta = {
    description = "Collection of helpers and mock objects for unit tests and doc tests";
    homepage = "https://github.com/Simplistix/testfixtures";
    license = lib.licenses.mit;
  };
})
