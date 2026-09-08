{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "phonenumbers";
  version = "9.0.38";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-aAa+vUZjivL8JglnXqBGBnpAUS7Kgb8URhMuL9op0RM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "phonenumbers" ];

  meta = {
    description = "Python module for handling international phone numbers";
    homepage = "https://github.com/daviddrysdale/python-phonenumbers";
    license = lib.licenses.asl20;
  };
}
