{
  buildPythonPackage,
  callPackage,
  fetchFromGitHub,
  lib,
  fetchpatch2,

  # build-system
  hatchling,

  # dependencies
  executing,
  opentelemetry-exporter-otlp-proto-http,
  opentelemetry-instrumentation,
  opentelemetry-sdk,
  protobuf,
  rich,
  tomli,
  typing-extensions,

  # optional dependencies
  opentelemetry-instrumentation-aiohttp-client,
  opentelemetry-instrumentation-asgi,
  opentelemetry-instrumentation-celery,
  opentelemetry-instrumentation-django,
  opentelemetry-instrumentation-fastapi,
  opentelemetry-instrumentation-flask,
  opentelemetry-instrumentation-httpx,
  opentelemetry-instrumentation-psycopg,
  opentelemetry-instrumentation-psycopg2,
  opentelemetry-instrumentation-redis,
  opentelemetry-instrumentation-requests,
  opentelemetry-instrumentation-sqlalchemy,
  opentelemetry-instrumentation-sqlite3,
  opentelemetry-instrumentation-system-metrics,
  opentelemetry-instrumentation-wsgi,
  packaging,

  # test dependencies
  anthropic,
  anyio,
  asyncpg,
  cloudpickle,
  dirty-equals,
  google-genai,
  inline-snapshot,
  litellm,
  logfire-api,
  loguru,
  mysql-connector-python,
  openai-agents,
  pandas,
  pymongo,
  pymysql,
  pytest-django,
  pytest-vcr,
  pytest-xdist,
  redis,
  requests-mock,
  sqlmodel,
  structlog,
  testcontainers,
}:

buildPythonPackage (finalAttrs: {
  pname = "logfire";
  version = "4.37.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "pydantic";
    repo = "logfire";
    tag = "v${finalAttrs.version}";
    hash = "sha256-o6qtMiwXcfUuYkUrM+Iy6WhtwBOLK3q/nqPDC5QMmg0=";
  };

  patches = [
    # https://github.com/pydantic/logfire/pull/2042
    (fetchpatch2 {
      url = "https://github.com/pydantic/logfire/commit/c7ff8beec3a674a2b096fcd9395159723de4cc67.patch";
      hash = "sha256-HdPT1cYOUiyjJBUYC5yoVRjC+gWyCMvo1MpOSL32lPM=";
      excludes = [
        "uv.lock"
      ];
    })
  ];

  build-system = [ hatchling ];

  dependencies = [
    executing
    opentelemetry-exporter-otlp-proto-http
    opentelemetry-instrumentation
    opentelemetry-sdk
    protobuf
    rich
    tomli
    typing-extensions
  ];

  # Some optional dependencies are commented out because the deps they require
  # are not in nixpkgs as of writing
  optional-dependencies = {
    aiohttp = [ opentelemetry-instrumentation-aiohttp-client ];
    aiohttp-client = [ opentelemetry-instrumentation-aiohttp-client ];
    # aiohttp-server = [ opentelemetry-instrumentation-aiohttp-server ];
    asgi = [ opentelemetry-instrumentation-asgi ];
    # asyncpg = [ opentelemetry-instrumentation-asyncpg ];
    # aws-lambda = [ opentelemetry-instrumentation-aws-lambda ];
    celery = [ opentelemetry-instrumentation-celery ];
    django = [
      opentelemetry-instrumentation-asgi
      opentelemetry-instrumentation-django
    ];
    # dspy = [ opentelemetry-instrumentation-dspy ];
    fastapi = [ opentelemetry-instrumentation-fastapi ];
    flask = [ opentelemetry-instrumentation-flask ];
    # google-genai = [ opentelemetry-instrumentation-google-genai ];
    httpx = [ opentelemetry-instrumentation-httpx ];
    # litellm = [ opentelemetry-instrumentation-litellm ];
    # mysql = [ opentelemetry-instrumentation-mysql ];
    psycopg = [
      opentelemetry-instrumentation-psycopg
      packaging
    ];
    psycopg2 = [
      opentelemetry-instrumentation-psycopg2
      packaging
    ];
    # pymongo = [ opentelemetry-instrumentation-pymongo ];
    redis = [ opentelemetry-instrumentation-redis ];
    requests = [ opentelemetry-instrumentation-requests ];
    sqlalchemy = [ opentelemetry-instrumentation-sqlalchemy ];
    sqlite3 = [ opentelemetry-instrumentation-sqlite3 ];
    # starlette = [ opentelemetry-instrumentation-starlette ];
    system-metrics = [ opentelemetry-instrumentation-system-metrics ];
    wsgi = [ opentelemetry-instrumentation-wsgi ];
  };

  pythonImportsCheck = [ "logfire" ];

  # Too many outdated snapshots that fail with inline-snapshot
  doCheck = false;
  meta = {
    description = "Uncomplicated Observability for Python and beyond";
    downloadPage = "https://github.com/pydantic/logfire/releases/tag/${finalAttrs.src.tag}";
    homepage = "https://logfire.pydantic.dev";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
