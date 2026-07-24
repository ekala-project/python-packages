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
  asttokens,
  asyncpg,
  blinker,
  celery,
  django,
  executing,
  fastapi,
  flask,
  grpcio,
  httpcore,
  httpx,
  huggingface-hub,
  loguru,
  markupsafe,
  openai,
  protobuf,
  pure-eval,
  pymongo,
  sqlalchemy,
  starlette,
  tiktoken,
  tornado,
}:

buildPythonPackage (finalAttrs: {
  pname = "sentry-sdk";
  version = "2.66.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "getsentry";
    repo = "sentry-python";
    tag = finalAttrs.version;
    hash = "sha256-E1/uSHk20jtP0jC7lps2C/bfgl6kH714/zD6tlD7VmM=";
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
    celery = [ celery ];
    django = [ django ];
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
    huggingface-hub = [ huggingface-hub ];
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
