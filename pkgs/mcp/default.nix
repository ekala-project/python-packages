{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,
  uv-dynamic-versioning,

  # dependencies
  anyio,
  httpx,
  httpx-sse,
  jsonschema,
  pydantic,
  pydantic-settings,
  pyjwt,
  python-multipart,
  sse-starlette,
  starlette,
  uvicorn,

  # optional-dependencies
  # cli
  python-dotenv,
  typer,
  # rich
  rich,
  # ws
  websockets,
}:

buildPythonPackage (finalAttrs: {
  pname = "mcp";
  version = "1.27.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "modelcontextprotocol";
    repo = "python-sdk";
    tag = "v${finalAttrs.version}";
    hash = "sha256-qvbGyF0PVC626yCgUqOYmA1zOmvI3/bC7l7HhfOtKH8=";
  };

  postPatch = lib.optionalString stdenv.buildPlatform.isDarwin ''
    substituteInPlace tests/client/test_stdio.py \
      --replace-fail "time.sleep(0.1)" "time.sleep(1)"
  '';

  build-system = [
    hatchling
    uv-dynamic-versioning
  ];

  pythonRelaxDeps = [
    "pydantic-settings"
  ];

  dependencies = [
    anyio
    httpx
    httpx-sse
    jsonschema
    pydantic
    pydantic-settings
    pyjwt
    python-multipart
    sse-starlette
    starlette
    uvicorn
  ];

  optional-dependencies = {
    cli = [
      python-dotenv
      typer
    ];
    rich = [
      rich
    ];
    ws = [
      websockets
    ];
  };

  pythonImportsCheck = [ "mcp" ];

  meta = {
    description = "Official Python SDK for Model Context Protocol servers and clients";
    homepage = "https://github.com/modelcontextprotocol/python-sdk";
    license = lib.licenses.mit;
  };
})
