{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  certifi,
  urllib3,

  # optional-dependencies
  aiohttp,
  anthropic,
  apache-beam,
  asttokens,
  asyncpg,
  blinker,
  bottle,
  celery,
  celery-redbeat,
  chalice,
  clickhouse-driver,
  django,
  executing,
  falcon,
  fastapi,
  flask,
  grpcio,
  httpcore,
  httpx,
  huey,
  huggingface-hub,
  langchain,
  litestar,
  loguru,
  markupsafe,
  openai,
  protobuf,
  pure-eval,
  pymongo,
  pyspark,
  quart,
  rq,
  sanic,
  sqlalchemy,
  starlette,
  tiktoken,
  tornado,
}:

buildPythonPackage (finalAttrs: {
  pname = "sentry-sdk";
  version = "2.63.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "getsentry";
    repo = "sentry-python";
    tag = finalAttrs.version;
    hash = "sha256-Gvvgv6NQtzlwzXSspiu1nApHfu/o+l8SsavcTiZRiVo=";
  };

  postPatch = ''
    sed -i "/addopts =/d" pyproject.toml
  '';

  build-system = [
    setuptools
  ];

  dependencies = [
    certifi
    urllib3
  ];

  optional-dependencies = {
    aiohttp = [ aiohttp ];
    anthropic = [ anthropic ];
    asyncpg = [ asyncpg ];
    asyncio = [ httpcore ] ++ httpcore.optional-dependencies.asyncio;
    beam = [ apache-beam ];
    bottle = [ bottle ];
    celery = [ celery ];
    celery-redbeat = [ celery-redbeat ];
    chalice = [ chalice ];
    clickhouse-driver = [ clickhouse-driver ];
    django = [ django ];
    falcon = [ falcon ];
    fastapi = [ fastapi ];
    flask = [
      blinker
      flask
      markupsafe
    ];
    grpcio = [
      grpcio
      protobuf
    ];
    http2 = [ httpcore ] ++ httpcore.optional-dependencies.http2;
    httpx = [ httpx ];
    huey = [ huey ];
    huggingface-hub = [ huggingface-hub ];
    langchain = [ langchain ];
    litestar = [ litestar ];
    loguru = [ loguru ];
    openai = [
      openai
      tiktoken
    ];
    pure_eval = [
      asttokens
      executing
      pure-eval
    ];
    pymongo = [ pymongo ];
    pyspark = [ pyspark ];
    quart = [
      blinker
      quart
    ];
    rq = [ rq ];
    sanic = [ sanic ];
    sqlalchemy = [ sqlalchemy ];
    starlette = [ starlette ];
    tornado = [ tornado ];
  };

  pythonImportsCheck = [ "sentry_sdk" ];

  meta = {
    description = "Official Python SDK for Sentry.io";
    homepage = "https://github.com/getsentry/sentry-python";
    license = lib.licenses.mit;
  };
})
