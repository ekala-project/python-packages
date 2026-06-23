{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,
  uv-dynamic-versioning,

  # dependencies
  anthropic,
  authlib,
  azure-identity,
  cyclopts,
  exceptiongroup,
  griffelib,
  httpx,
  jsonref,
  jsonschema-path,
  mcp,
  fakeredis,
  google-genai,
  openai,
  openapi-pydantic,
  opentelemetry-api,
  packaging,
  platformdirs,
  py-key-value-aio,
  pydantic,
  pydantic-monty,
  pydocket,
  pyjwt,
  pyperclip,
  python-dotenv,
  pyyaml,
  rich,
  uncalled-for,
  uvicorn,
  watchfiles,
  websockets,
}:

buildPythonPackage (finalAttrs: {
  pname = "fastmcp";
  version = "3.2.4";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "PrefectHQ";
    repo = "fastmcp";
    tag = "v${finalAttrs.version}";
    hash = "sha256-rJpxPvqAaa6/vXhG1+R9dI32cY/54e6I+F/zyBVoqBM=";
  };

  build-system = [
    hatchling
    uv-dynamic-versioning
  ];

  pythonRelaxDeps = [
    "py-key-value-aio"
    "pydocket"
  ];

  dependencies = [
    authlib
    cyclopts
    exceptiongroup
    griffelib
    httpx
    jsonref
    jsonschema-path
    mcp
    openapi-pydantic
    opentelemetry-api
    packaging
    platformdirs
    py-key-value-aio
    pydantic
    pyperclip
    python-dotenv
    pyyaml
    rich
    uncalled-for
    uvicorn
    watchfiles
    websockets
  ]
  ++ py-key-value-aio.optional-dependencies.filetree
  ++ py-key-value-aio.optional-dependencies.keyring
  ++ py-key-value-aio.optional-dependencies.memory
  ++ pydantic.optional-dependencies.email;

  optional-dependencies = {
    anthropic = [ anthropic ];
    azure = [
      azure-identity
      pyjwt
    ];
    code-mode = [ pydantic-monty ];
    gemini = [ google-genai ];
    openai = [ openai ];
    tasks = [
      pydocket
      fakeredis
    ]
    ++ fakeredis.optional-dependencies.lua;
  };

  pythonImportsCheck = [ "fastmcp" ];

  meta = {
    description = "Fast, Pythonic way to build MCP servers and clients";
    homepage = "https://github.com/PrefectHQ/fastmcp";
    license = lib.licenses.asl20;
  };
})
