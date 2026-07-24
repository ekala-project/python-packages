{
  lib,
  stdenv,
  fetchFromGitHub,
  buildPythonPackage,

  # build-system
  poetry-core,

  # dependencies
  asgiref,
  httpx,
  inflection,
  jsonschema,
  jinja2,
  python-multipart,
  pyyaml,
  requests,
  starlette,
  typing-extensions,
  werkzeug,

  # optional-dependencies
  a2wsgi,
  flask,
  swagger-ui-bundle,
  uvicorn,

  # tests
  pytest-aiohttp,
  testfixtures,
}:

buildPythonPackage rec {
  pname = "connexion";
  version = "3.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "spec-first";
    repo = "connexion";
    tag = version;
    hash = "sha256-mUnot9kdUgpxMXjKnkRzK9Dp2c7ibJzv4qX61ZPuJHM=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    asgiref
    httpx
    inflection
    jsonschema
    jinja2
    python-multipart
    pyyaml
    requests
    starlette
    typing-extensions
    werkzeug
  ];

  optional-dependencies = {
    flask = [
      a2wsgi
      flask
    ];
    swagger-ui = [ swagger-ui-bundle ];
    uvicorn = [ uvicorn ];
  };
  meta = {
    description = "Swagger/OpenAPI First framework on top of Flask";
    homepage = "https://github.com/spec-first/connexion";
    license = lib.licenses.asl20;
    maintainers = [ ];
    mainProgram = "connexion";
  };
}
