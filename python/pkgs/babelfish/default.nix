{
  lib,
  buildPythonPackage,
  fetchPypi,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "babelfish";
  version = "0.6.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-3stnpGYIiNSEgKtpmDCYNxdBWNDxqmO+uxwuEaq5eqs=";
  };

  build-system = [ poetry-core ];

  doCheck = false;

  pythonImportsCheck = [ "babelfish" ];

  meta = {
    description = "Module to work with countries and languages";
    homepage = "https://github.com/Diaoul/babelfish";
    license = lib.licenses.bsd3;
  };
}
