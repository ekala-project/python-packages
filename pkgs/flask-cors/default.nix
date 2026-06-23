{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  flask,
  werkzeug,
}:

buildPythonPackage rec {
  pname = "flask-cors";
  version = "6.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "corydolphin";
    repo = "flask-cors";
    tag = version;
    hash = "sha256-9WlD5Qd0WiBDrVHf5nT1qAK2gtYavlPnY7qFkiAgxws=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    flask
    werkzeug
  ];

  pythonImportsCheck = [ "flask_cors" ];

  meta = {
    description = "Flask extension adding a decorator for CORS support";
    homepage = "https://github.com/corydolphin/flask-cors";
    license = lib.licenses.mit;
  };
}
