{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "phpserialize";
  version = "1.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-v2ctMS0gPQmoTCY2b6uPQ4o/+zVcQH5pl0t+8tOaD6c=";
  };

  build-system = [ setuptools ];

  # project does not have tests

  pythonImportsCheck = [ "phpserialize" ];

  meta = {
    description = "Port of the serialize and unserialize functions of PHP to Python";
    homepage = "https://github.com/mitsuhiko/phpserialize";
    license = lib.licenses.bsd3;
  };
}
