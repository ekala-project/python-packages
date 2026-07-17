{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  flask,
  werkzeug,
}:

buildPythonPackage rec {
  pname = "flask-login";
  version = "0.6.3";
  pyproject = true;

  src = fetchPypi {
    pname = "Flask-Login";
    inherit version;
    hash = "sha256-XiPRSmB+8SgGxplZC4nQ8ODWe67sWZ11lHv5wUczAzM=";
  };

  build-system = [ setuptools ];

  dependencies = [
    flask
    werkzeug
  ];

  doCheck = false;

  pythonImportsCheck = [ "flask_login" ];

  meta = {
    description = "User session management for Flask";
    homepage = "https://github.com/maxcountryman/flask-login";
    license = lib.licenses.mit;
  };
}
