{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "beaker";
  version = "1.14.1";
  pyproject = true;

  src = fetchPypi {
    pname = "beaker";
    inherit (finalAttrs) version;
    hash = "sha256-iG9SpRgQcD/bwKPlT8pAiGKI/1MLIHBYLtznK/GUVEc=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "beaker" ];

  meta = {
    homepage = "https://github.com/bbangert/beaker";
    description = "Session and Caching library with WSGI Middleware";
    license = lib.licenses.bsd3;
  };
})
