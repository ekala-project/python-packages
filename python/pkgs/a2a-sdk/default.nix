{
  lib,
  aiosqlite,
  buildPythonPackage,
  cryptography,
  fastapi,
  fetchFromGitHub,
  google-api-core,
  grpcio-reflection,
  grpcio-tools,
  grpcio,
  hatchling,
  httpx-sse,
  httpx,
  json-rpc,
  opentelemetry-api,
  opentelemetry-sdk,
  protobuf,
  pydantic,
  pyjwt,
  pytest-asyncio,
  pytest-cov-stub,
  pytest-timeout,
  pytest-xdist,
  pythonAtLeast,
  respx,
  sqlalchemy,
  sse-starlette,
  starlette,
  stdenv,
  uv-dynamic-versioning,
  uvicorn,
}:

buildPythonPackage (finalAttrs: {
  pname = "a2a-sdk";
  version = "1.1.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "a2aproject";
    repo = "a2a-python";
    tag = "v${finalAttrs.version}";
    hash = "sha256-2GeASVY9mBttimRWFMwWi38ld+aUtQrOpjvatTRmRjY=";
  };

  build-system = [
    hatchling
    uv-dynamic-versioning
  ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "protobuf>=5.29.5,<7" "protobuf>=5.29.5"
  '';

  dependencies = [
    google-api-core
    httpx
    httpx-sse
    json-rpc
    protobuf
    pydantic
  ];

  optional-dependencies = {
    encryption = [ cryptography ];
    grpc = [
      grpcio
      grpcio-reflection
      grpcio-tools
    ];
    http-server = [
      fastapi
      sse-starlette
      starlette
    ];
    mysql = [
      sqlalchemy
    ]
    ++ sqlalchemy.optional-dependencies.asyncio
    ++ sqlalchemy.optional-dependencies.postgresql_asyncpg;
    postgresql = [
      sqlalchemy
    ]
    ++ sqlalchemy.optional-dependencies.asyncio
    ++ sqlalchemy.optional-dependencies.postgresql_asyncpg;
    signing = [ pyjwt ];
    sqlite = [
      sqlalchemy
    ]
    ++ sqlalchemy.optional-dependencies.asyncio
    ++ sqlalchemy.optional-dependencies.aiosqlite;
    telemetry = [
      opentelemetry-api
      opentelemetry-sdk
    ];
  };
  meta = {
    description = "Python SDK for the Agent2Agent (A2A) Protocol";
    homepage = "https://github.com/a2aproject/a2a-python";
    license = lib.licenses.asl20;
  };
})
