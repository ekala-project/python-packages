{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,
  uv-dynamic-versioning,

  # dependencies
  email-validator,
  anthropic,
  authlib,
  griffelib,
  azure-identity,
  cyclopts,
  exceptiongroup,
  httpx,
  jsonref,
  jsonschema-path,
  mcp,
  google-genai,
  openai,
  openapi-pydantic,
  opentelemetry-api,
  packaging,
  platformdirs,
  py-key-value-aio,
  pydantic,
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

  dependencies = [
    authlib
    cyclopts
    email-validator
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
  ++ py-key-value-aio.optional-dependencies.memory;

  optional-dependencies = {
    anthropic = [ anthropic ];
    azure = [
      azure-identity
      pyjwt
    ];
    gemini = [ google-genai ];
    openai = [ openai ];
  };

  pythonImportsCheck = [ "fastmcp" ];

  meta = {
    description = "Fast, Pythonic way to build MCP servers and clients";
    homepage = "https://github.com/PrefectHQ/fastmcp";
    license = lib.licenses.asl20;
  };
})
