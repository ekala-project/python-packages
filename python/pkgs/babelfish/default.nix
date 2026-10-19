{
  lib,
  buildPythonPackage,
  fetchPypi,
  poetry-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "babelfish";
  version = "0.6.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-3stnpGYIiNSEgKtpmDCYNxdBWNDxqmO+uxwuEaq5eqs=";
  };

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "babelfish" ];

  meta = {
    description = "Module to work with countries and languages";
    homepage = "https://github.com/Diaoul/babelfish";
    license = lib.licenses.bsd3;
  };
})
