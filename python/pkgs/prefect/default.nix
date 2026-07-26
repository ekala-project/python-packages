{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pythonAtLeast,
  pythonOlder,
  writeShellScriptBin,

  aiosqlite,
  alembic,
  amplitude-analytics,
  anyio,
  apprise,
  asgi-lifespan,
  asyncpg,
  cachetools,
  click,
  cloudpickle,
  coolname,
  cryptography,
  cyclopts,
  dateparser,
  docker,
  exceptiongroup,
  fastapi,
  fsspec,
  graphviz,
  greenlet,
  griffe,
  hatchling,
  httpcore,
  httpx,
  humanize,
  jinja2-humanize-extension,
  jinja2,
  jsonpatch,
  jsonschema,
  opentelemetry-api,
  opentelemetry-distro,
  opentelemetry-exporter-otlp,
  opentelemetry-instrumentation,
  opentelemetry-instrumentation-logging,
  opentelemetry-instrumentation-system-metrics,
  opentelemetry-test-utils,
  orjson,
  packaging,
  pathspec,
  pendulum,
  pluggy,
  prometheus-client,
  pydantic-core,
  pydantic-extra-types,
  pydantic-settings,
  pydantic,
  pydocket,
  python-dateutil,
  python-on-whales,
  python-slugify,
  pytz,
  pyyaml,
  readchar,
  rfc3339-validator,
  rich,
  ruamel-yaml-clib,
  ruamel-yaml,
  semver,
  sniffio,
  sqlalchemy,
  toml,
  typing-extensions,
  uvicorn,
  versioningit,
  websockets,
  whenever,
}:

buildPythonPackage (finalAttrs: {
  pname = "prefect";
  version = "3.7.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "PrefectHQ";
    repo = "prefect";
    tag = finalAttrs.version;
    hash = "sha256-AfiXH9u6W6UpE8hepNzPGIm1cxC+5RonhtBYWMu2IaQ=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail \
        'default-version = "3.6.24+nogit"' \
        'default-version = "${finalAttrs.version}"'
  '';

  # versioningit: NotVCSError: Git not installed; assuming this isn't a Git repository
  nativeBuildInputs = [
    (writeShellScriptBin "git" "false")
  ];

  build-system = [
    hatchling
    versioningit
  ];

  dependencies = [
    aiosqlite
    alembic
    apprise
    asyncpg
    click
    cryptography
    cyclopts
    dateparser
    docker
    jinja2
    jinja2-humanize-extension
    pytz
    readchar
    sqlalchemy
    # client dependencies
    amplitude-analytics
    anyio
    asgi-lifespan
    cachetools
    cloudpickle
    coolname
    exceptiongroup
    fastapi
    fsspec
    graphviz
    griffe
    httpcore
    httpx
    humanize
    jsonpatch
    jsonschema
    opentelemetry-api
    orjson
    packaging
    pathspec
    pluggy
    prometheus-client
    pydantic
    pydantic-core
    pydantic-extra-types
    pydantic-settings
    pydocket
    python-dateutil
    python-slugify
    pyyaml
    rfc3339-validator
    rich
    ruamel-yaml
    ruamel-yaml-clib
    semver
    sniffio
    toml
    typing-extensions
    uvicorn
    websockets
  ]
  ++ [ greenlet ] # sqlalchemy[asyncio]
  ++ httpx.optional-dependencies.http2
  ++ lib.optional (pythonOlder "3.13") pendulum
  ++ lib.optional (pythonAtLeast "3.13") whenever;

  optional-dependencies = {
    buildx = [
      python-on-whales
    ];
    otel = [
      opentelemetry-distro
      opentelemetry-exporter-otlp
      opentelemetry-instrumentation
      opentelemetry-instrumentation-logging
      opentelemetry-instrumentation-system-metrics
      opentelemetry-test-utils
    ];
  };

  # Tests are extremely slow and require complex infrastructure
  doCheck = false;

  pythonImportsCheck = [ "prefect" ];

  meta = {
    description = "Workflow orchestration framework for building resilient data pipelines in Python";
    homepage = "https://github.com/PrefectHQ/prefect";
    license = lib.licenses.asl20;
    maintainers = [ ];
    mainProgram = "prefect";
  };
})
