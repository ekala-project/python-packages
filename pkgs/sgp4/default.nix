{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "sgp4";
  version = "2.25";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-4Z7cbcwl1p+4/eCiZ7jwxE1+kVx7y+rPXTqLWVuvBnQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "sgp4" ];

  meta = {
    description = "Python version of the SGP4 satellite position library";
    homepage = "https://github.com/brandon-rhodes/python-sgp4";
    license = lib.licenses.mit;
  };
}
