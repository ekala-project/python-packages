{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  distro,
  httpx2,
  orjson,
  pydantic,
  requests,
  requests-toolbelt,
  sniffio,
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
  version = "0.12.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "langchain-ai";
    repo = "langsmith-sdk";
    tag = "v${finalAttrs.version}";
    hash = "sha256-iq1Yq0HdSggELgi5A2r9X56ATlAD3YNv935H3bczmkA=";
  };

  sourceRoot = "${finalAttrs.src.name}/python";

  pythonRelaxDeps = [ "orjson" ];

  build-system = [ hatchling ];

  dependencies = [
    distro
    httpx2
    orjson
    pydantic
    requests
    requests-toolbelt
    sniffio
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
    mainProgram = "langsmith";
  };
})
