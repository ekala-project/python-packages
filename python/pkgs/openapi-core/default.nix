{
  lib,
  aiohttp,
  aioitertools,
  buildPythonPackage,
  django,
  falcon,
  fastapi,
  fetchFromGitHub,
  flask,
  httpx,
  isodate,
  jsonschema,
  jsonschema-path,
  more-itertools,
  multidict,
  openapi-schema-validator,
  openapi-spec-validator,
  parse,
  poetry-core,
  pytest-aiohttp,
  pytest-cov-stub,
  responses,
  requests,
  starlette,
  webob,
  werkzeug,
}:

buildPythonPackage rec {
  pname = "openapi-core";
  version = "0.23.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "p1c2u";
    repo = "openapi-core";
    tag = version;
    hash = "sha256-wGaRx+IEqsvs7ygCDgh1H4di662SQhjmpB9LMP/YGKM=";
  };

  build-system = [ poetry-core ];

  pythonRelaxDeps = [
    "jsonschema-path"
  ];

  dependencies = [
    isodate
    more-itertools
    parse
    openapi-schema-validator
    openapi-spec-validator
    werkzeug
    jsonschema-path
    jsonschema
  ];

  optional-dependencies = {
    aiohttp = [
      aiohttp
      multidict
    ];
    django = [ django ];
    falcon = [ falcon ];
    fastapi = [ fastapi ];
    flask = [ flask ];
    requests = [ requests ];
    starlette = [
      aioitertools
      starlette
    ];
  };
  pythonImportsCheck = [
    "openapi_core"
    "openapi_core.validation.request.validators"
    "openapi_core.validation.response.validators"
  ];

  meta = {
    description = "Client-side and server-side support for the OpenAPI Specification v3";
    homepage = "https://github.com/python-openapi/openapi-core";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
