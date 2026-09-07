{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  flask,
  werkzeug,
}:

buildPythonPackage rec {
  pname = "flask-cors";
  version = "6.0.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "corydolphin";
    repo = "flask-cors";
    tag = version;
    hash = "sha256-fngKJm7/7BMcWPPFncTCWw2sL1UJ0t4ICpXr95yNpbg=";
  };

  build-system = [
    setuptools
    setuptools-scm
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
