{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "first";
  version = "2.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-/yhbCMVfjJfOTqcBJ0OvJJXJ8SkXhfFjcivTb2r2078=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "first" ];

  meta = {
    description = "Function you always missed in Python";
    homepage = "https://github.com/hynek/first/";
    license = lib.licenses.mit;
  };
}
