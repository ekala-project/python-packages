{
  lib,
  buildPythonPackage,
  fetchPypi,
  flask,
  setuptools,
}:

buildPythonPackage rec {
  pname = "flask-swagger-ui";
  version = "5.32.14";
  pyproject = true;

  src = fetchPypi {
    pname = "flask_swagger_ui";
    inherit version;
    hash = "sha256-p3lUxjMu7Q+SaCt71+90n2MSf3NlqEqaimh+JvzEOg4=";
  };

  build-system = [ setuptools ];

  doCheck = false; # there are no tests

  dependencies = [ flask ];

  meta = {
    homepage = "https://github.com/sveint/flask-swagger-ui";
    license = lib.licenses.mit;
    description = "Swagger UI blueprint for Flask";
    maintainers = [ ];
  };
}
