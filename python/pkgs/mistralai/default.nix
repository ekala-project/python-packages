{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  eval-type-backport,
  httpx,
  jsonpath-python,
  opentelemetry-api,
  opentelemetry-semantic-conventions,
  pydantic,
  python-dateutil,
  typing-inspection,

  # optional-dependencies
  authlib,
  griffe,
  mcp,
  google-auth,
  requests,
  websockets,
  opentelemetry-exporter-otlp-proto-http,

  # tests
  opentelemetry-sdk,
  pytest-asyncio,
}:

buildPythonPackage (finalAttrs: {
  pname = "mistralai";
  version = "2.6.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "mistralai";
    repo = "client-python";
    tag = "v${finalAttrs.version}";
    hash = "sha256-ddQOi7jZiV3affmbsDI36n3wpbkLup5MuJ+9iDPZbro=";
  };

  preBuild = ''
    python scripts/prepare_readme.py
  '';

  build-system = [
    hatchling
  ];

  pythonRelaxDeps = [
    "opentelemetry-semantic-conventions"
  ];
  dependencies = [
    eval-type-backport
    httpx
    jsonpath-python
    opentelemetry-api
    opentelemetry-semantic-conventions
    pydantic
    python-dateutil
    typing-inspection
  ];

  optional-dependencies = {
    agents = [
      authlib
      griffe
      mcp
    ];
    gcp = [
      google-auth
      requests
    ];
    realtime = [
      websockets
    ];
    telemetry = [
      opentelemetry-sdk
      opentelemetry-exporter-otlp-proto-http
    ];
  };

  pythonImportsCheck = [ "mistralai" ];
  meta = {
    description = "Python client library for Mistral AI platform";
    homepage = "https://github.com/mistralai/client-python";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
