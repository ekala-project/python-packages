{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "phonenumbers";
  version = "9.0.43";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-1OUIq4AMPlziGbFL4znes9VaCrga+C/qRHSfyr0B6Qg=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "phonenumbers" ];

  meta = {
    description = "Python module for handling international phone numbers";
    homepage = "https://github.com/daviddrysdale/python-phonenumbers";
    license = lib.licenses.asl20;
  };
})
