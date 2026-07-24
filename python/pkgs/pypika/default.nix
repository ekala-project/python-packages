{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pypika";
  version = "0.51.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-wwx8EEj78Fb9OSDForiLDCndGQqbK+6XH9F+Sr5NDr4=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pypika" ];

  meta = {
    description = "Python SQL query builder";
    homepage = "https://github.com/kayak/pypika";
    license = lib.licenses.asl20;
  };
})
