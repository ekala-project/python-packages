{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  poetry-core,

  # propagates
  jsonschema,
  jsonschema-path,
  lazy-object-proxy,
  openapi-schema-validator,
}:

buildPythonPackage rec {
  pname = "openapi-spec-validator";
  version = "0.8.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-openapi";
    repo = "openapi-spec-validator";
    tag = version;
    hash = "sha256-KY9mDnF/R2UO8WZ0WyBzpZQsVBxzxnTK6zyqvUb+hVw=";
  };

  build-system = [ poetry-core ];

  pythonRelaxDeps = [
    "jsonschema"
  ];

  dependencies = [
    jsonschema
    jsonschema-path
    lazy-object-proxy
    openapi-schema-validator
  ];

  pythonImportsCheck = [
    "openapi_spec_validator"
    "openapi_spec_validator.readers"
  ];

  meta = {
    description = "Validates OpenAPI Specs against the OpenAPI 2.0 (aka Swagger) and OpenAPI 3.0.0 specification";
    mainProgram = "openapi-spec-validator";
    homepage = "https://github.com/p1c2u/openapi-spec-validator";
    license = lib.licenses.asl20;
  };
}
