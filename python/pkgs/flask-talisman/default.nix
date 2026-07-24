{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  flask,
  six,
}:

buildPythonPackage rec {
  pname = "flask-talisman";
  version = "1.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-xfSG9fVEIHKfhLPDhQzWP5bosDOpYpvuZsUk6jY3l/8=";
  };

  build-system = [ setuptools ];

  dependencies = [
    flask
    six
  ];

  pythonImportsCheck = [ "flask_talisman" ];

  meta = {
    description = "HTTP security headers for Flask";
    homepage = "https://github.com/wntrblm/flask-talisman";
    license = lib.licenses.asl20;
  };
}
