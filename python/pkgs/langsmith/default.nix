{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  httpx,
  orjson,
  pydantic,
  requests,
  requests-toolbelt,
  uuid-utils,
  websockets,
  xxhash,
  zstandard,

  # tests
  anthropic,
  attrs,
  dataclasses-json,
  multipart,
  opentelemetry-sdk,
  pytest-asyncio,
  pytest-httpx,
  pytest-socket,
  pytest-vcr,
}:

buildPythonPackage (finalAttrs: {
  pname = "langsmith";
  version = "0.8.18";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "langchain-ai";
    repo = "langsmith-sdk";
    tag = "v${finalAttrs.version}";
    hash = "sha256-YQ49pg0+RepwlEHtu8GDUpfnXQF3yFiz6ZeRcnHXSWU=";
  };

  sourceRoot = "${finalAttrs.src.name}/python";

  pythonRelaxDeps = [ "orjson" ];

  build-system = [ hatchling ];

  dependencies = [
    httpx
    orjson
    pydantic
    requests
    requests-toolbelt
    uuid-utils
    websockets
    xxhash
    zstandard
  ];
  # evaluation and external tests require OpenAPI key
  # integration tests are all marked flaky
  disabledTestMarks = [
    "flaky"
  ];
  pythonImportsCheck = [ "langsmith" ];
  meta = {
    description = "Client library to connect to the LangSmith LLM Tracing and Evaluation Platform";
    homepage = "https://github.com/langchain-ai/langsmith-sdk";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "langsmith";
  };
})
