{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "sgp4";
  version = "2.27";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-BtNyR8aYVzm3B7izm2uD4G6K94OyUx4xllUBupg5hfk=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "sgp4" ];

  meta = {
    description = "Python version of the SGP4 satellite position library";
    homepage = "https://github.com/brandon-rhodes/python-sgp4";
    license = lib.licenses.mit;
  };
}
