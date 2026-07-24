{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "phonenumbers";
  version = "9.0.34";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-AHUcddEWZIXKgM4C7BW2phomKOmzEzgVeTMLxwyTQHU=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "phonenumbers" ];

  meta = {
    description = "Python module for handling international phone numbers";
    homepage = "https://github.com/daviddrysdale/python-phonenumbers";
    license = lib.licenses.asl20;
  };
}
