{
  lib,
  buildPythonPackage,
  fetchPypi,
  flask,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "flask-swagger-ui";
  version = "5.34.1";
  pyproject = true;

  src = fetchPypi {
    pname = "flask_swagger_ui";
    inherit (finalAttrs) version;
    hash = "sha256-45wQLT9htNVGe3PGpNLkCE+ALaYt4HPD5WwPIutqU6o=";
  };

  build-system = [ setuptools ];

  dependencies = [ flask ];

  meta = {
    homepage = "https://github.com/sveint/flask-swagger-ui";
    license = lib.licenses.mit;
    description = "Swagger UI blueprint for Flask";
  };
})
