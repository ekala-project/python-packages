{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage rec {
  pname = "bracex";
  version = "2.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-mPE0fNd+Iu6NlnowrU4xCyM/d1Tb8x/z/Ot2FFukfcc=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "bracex" ];

  meta = {
    homepage = "https://github.com/facelessuser/bracex";
    description = "Bash style brace expansion for Python";
    license = lib.licenses.mit;
  };
}
