{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  setuptools
, # dependencies
  aniso8601
, flask
, importlib-resources
, jsonschema
, pytz
, werkzeug
,
}:

buildPythonPackage (finalAttrs: {
  pname = "flask-restx";
  version = "1.3.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-restx";
    repo = "flask-restx";
    tag = finalAttrs.version;
    hash = "sha256-KSHRfGX6M/w09P35A68u7uzMKaRioytScPh0Sw8JBfw=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aniso8601
    flask
    importlib-resources
    jsonschema
    pytz
    werkzeug
  ];

  pythonImportsCheck = [ "flask_restx" ];

  meta = {
    description = "Fully featured framework for fast, easy and documented API development with Flask";
    homepage = "https://github.com/python-restx/flask-restx";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
