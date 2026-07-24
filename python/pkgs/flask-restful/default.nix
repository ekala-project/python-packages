{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  aniso8601,
  flask,
  pytz,
  six,
}:

buildPythonPackage rec {
  pname = "flask-restful";
  version = "0.3.10";
  pyproject = true;

  src = fetchPypi {
    pname = "Flask-RESTful";
    inherit version;
    hash = "sha256-/kry7wAn34+bT3l6uiDFVmgBtq3plaxjtYir8aWc7Dc=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aniso8601
    flask
    pytz
    six
  ];

  pythonImportsCheck = [ "flask_restful" ];

  meta = {
    description = "Framework for creating REST APIs";
    homepage = "https://flask-restful.readthedocs.io";
    license = lib.licenses.bsd3;
  };
}
