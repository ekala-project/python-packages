{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "funcy";
  version = "2.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-iXn+s95xIK/R0A5ajq6BDBlC5L+8kWlxUenuHkn3koQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "funcy" ];

  meta = {
    homepage = "https://funcy.readthedocs.org/";
    description = "Collection of fancy functional tools focused on practicality";
    license = lib.licenses.bsd3;
  };
})
