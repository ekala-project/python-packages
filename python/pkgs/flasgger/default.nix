{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  flask,
  jsonschema,
  mistune,
  packaging,
  pyyaml,
  six,
  werkzeug,
}:

buildPythonPackage rec {
  pname = "flasgger";
  version = "0.9.7.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ygmOEL+7EvBHrMYpnMcKM4UZQ6dG5VDYbmXmDU3yRfs=";
  };

  build-system = [ setuptools ];

  dependencies = [
    flask
    jsonschema
    mistune
    packaging
    pyyaml
    six
    werkzeug
  ];

  pythonImportsCheck = [ "flasgger" ];

  meta = {
    description = "Easy OpenAPI specs and Swagger UI for your Flask API";
    homepage = "https://github.com/flasgger/flasgger";
    license = lib.licenses.mit;
  };
}
