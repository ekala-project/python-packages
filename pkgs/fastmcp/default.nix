{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  email-validator,
  anthropic,
  authlib,
  azure-identity,
  cyclopts,
  exceptiongroup,
  httpx,
  jsonref,
  jsonschema-path,
  mcp,
  google-genai,
  openai,
  opentelemetry-api,
  packaging,
  platformdirs,
  pydantic,
  pyjwt,
  pyperclip,
  python-dotenv,
  pyyaml,
  rich,
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
  ];

  dependencies = [
    authlib
    cyclopts
    exceptiongroup
    httpx
    jsonref
    jsonschema-path
    mcp
    opentelemetry-api
    packaging
    platformdirs
    pydantic
    pyperclip
    python-dotenv
    pyyaml
    rich
    uvicorn
    watchfiles
    websockets
    email-validator
  ];

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
