{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "vine";
  version = "5.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-i2LpgdNcQQSSEc9ioKEkLYwe6b0Vuxls44rv1nmeYeA=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "vine" ];

  meta = {
    description = "Python promises";
    homepage = "https://github.com/celery/vine";
    license = lib.licenses.bsd3;
  };
})
