{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  annotated-types,
  anyio,
  attrs,
  brotli,
  click,
  cryptography,
  httpx,
  jinja2,
  jsbeautifier,
  litestar-htmx,
  mako,
  msgspec,
  multidict,
  multipart,
  polyfactory,
  prometheus-client,
  opentelemetry-instrumentation-asgi,
  pydantic-extra-types,
  pydantic,
  email-validator,
  pyjwt,
  pyyaml,
  redis,
  rich-click,
  rich,
  sniffio,
  structlog,
  typing-extensions,
  uvicorn,
  valkey,
}:

buildPythonPackage (finalAttrs: {
  pname = "litestar";
  version = "2.21.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "litestar-org";
    repo = "litestar";
    tag = "v${finalAttrs.version}";
    hash = "sha256-dH51GecYwVTnOO+F1FJnFR2VO3IvLbpKWbxK7jssak8=";
  };

  build-system = [ hatchling ];

  dependencies = [
    anyio
    click
    httpx
    litestar-htmx
    msgspec
    multidict
    multipart
    polyfactory
    pyyaml
    rich
    rich-click
    sniffio
    typing-extensions
  ];

  optional-dependencies = {
    annotated-types = [ annotated-types ];
    attrs = [ attrs ];
    brotli = [ brotli ];
    cli = [
      jsbeautifier
      uvicorn
    ]
    ++ uvicorn.optional-dependencies.standard;
    cryptography = [ cryptography ];
    jinja = [ jinja2 ];
    jwt = [
      cryptography
      pyjwt
    ];
    mako = [ mako ];
    opentelemetry = [ opentelemetry-instrumentation-asgi ];
    prometheus = [ prometheus-client ];
    pydantic = [
      pydantic
      email-validator
      pydantic-extra-types
    ];
    redis = [ redis ] ++ redis.optional-dependencies.hiredis;
    standard = [
      jinja2
      jsbeautifier
      uvicorn
    ]
    ++ uvicorn.optional-dependencies.standard;
    structlog = [ structlog ];
    valkey = [ valkey ] ++ valkey.optional-dependencies.libvalkey;
  };

  pythonImportsCheck = [ "litestar" ];

  meta = {
    description = "Production-ready, Light, Flexible and Extensible ASGI API framework";
    homepage = "https://litestar.dev/";
    license = lib.licenses.mit;
    mainProgram = "litestar";
    maintainers = [ ];
    platforms = lib.platforms.unix;
  };
})
