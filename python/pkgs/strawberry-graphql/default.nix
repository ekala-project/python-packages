{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  uv-build
, # dependencies
  cross-web
, graphql-core
, python-dateutil
, typing-extensions
, # optional-dependencies
  aiohttp
, pytest-aiohttp
, starlette
, python-multipart
, protobuf
, rich
, libcst
, typer
, pygments
, uvicorn
, django
, asgiref
, channels
, flask
, opentelemetry-api
, opentelemetry-sdk
, pydantic
, sanic
, fastapi
, chalice
, graphlib-backport
, pyinstrument
,
}:

buildPythonPackage (finalAttrs: {
  pname = "strawberry-graphql";
  version = "0.319.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "strawberry-graphql";
    repo = "strawberry";
    tag = finalAttrs.version;
    hash = "sha256-7mbinSIb0AhqMggaziiLCZQBJ0i2G6Dq0ZjGVnFLDiY=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "uv_build>=0.11,<0.12" "uv_build"
  '';

  build-system = [ uv-build ];

  dependencies = [
    cross-web
    graphql-core
    python-dateutil
    typing-extensions
  ];

  optional-dependencies = {
    aiohttp = [
      aiohttp
      pytest-aiohttp
    ];
    asgi = [
      starlette
      python-multipart
    ];
    apollo-federation = [ protobuf ];
    debug = [
      rich
      libcst
    ];
    debug-server = [
      typer
      libcst
      pygments
      python-multipart
      rich
      starlette
      uvicorn
    ];
    django = [
      django
      asgiref
    ];
    channels = [
      channels
      asgiref
    ];
    flask = [ flask ];
    opentelemetry = [
      opentelemetry-api
      opentelemetry-sdk
    ];
    pydantic = [ pydantic ];
    sanic = [ sanic ];
    fastapi = [
      fastapi
      python-multipart
    ];
    chalice = [ chalice ];
    cli = [
      pygments
      rich
      libcst
      typer
      graphlib-backport
    ];
    pyinstrument = [ pyinstrument ];
  };

  pythonImportsCheck = [ "strawberry" ];

  meta = {
    description = "GraphQL library for Python that leverages type annotations";
    homepage = "https://strawberry.rocks";
    license = lib.licenses.mit;
    mainProgram = "strawberry";
    maintainers = [ ];
  };
})
