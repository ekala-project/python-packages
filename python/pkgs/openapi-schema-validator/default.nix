{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  poetry-core,

  # dependencies
  jsonschema,
  jsonschema-specifications,
  pydantic,
  pydantic-settings,
  referencing,
  rfc3339-validator,
}:

buildPythonPackage rec {
  pname = "openapi-schema-validator";
  version = "0.9.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "p1c2u";
    repo = "openapi-schema-validator";
    tag = version;
    hash = "sha256-fqVmVdlZsHPH/C0LWXyeGDpSYVoIf63qIj1R7JeFi4I=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    jsonschema
    jsonschema-specifications
    pydantic
    pydantic-settings
    referencing
    rfc3339-validator
  ];

  doCheck = false;

  pythonImportsCheck = [ "openapi_schema_validator" ];

  meta = {
    description = "Validates OpenAPI schema against the OpenAPI Schema Specification v3.0 and v3.1";
    homepage = "https://github.com/python-openapi/openapi-schema-validator";
    license = lib.licenses.bsd3;
  };
}
