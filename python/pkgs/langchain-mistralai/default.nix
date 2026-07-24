{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  langchain-core,
  tokenizers,
  httpx,
  httpx-sse,
  pydantic,

  # tests
  langchain-tests,
  pytest-asyncio,
  gitUpdater,
}:

buildPythonPackage (finalAttrs: {
  pname = "langchain-mistralai";
  version = "1.1.6";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "langchain-ai";
    repo = "langchain";
    tag = "langchain-mistralai==${finalAttrs.version}";
    hash = "sha256-FkldUvLhbOS0FwRQaAZHebUv1jUSWMXMuIx780B6R+8=";
  };

  sourceRoot = "${finalAttrs.src.name}/libs/partners/mistralai";

  build-system = [ hatchling ];

  dependencies = [
    langchain-core
    tokenizers
    httpx
    httpx-sse
    pydantic
  ];
  pythonImportsCheck = [ "langchain_mistralai" ];

  passthru = {
    # python updater script sets the wrong tag
    skipBulkUpdate = true;
    updateScript = gitUpdater {
      rev-prefix = "langchain-mistralai==";
      ignoredVersions = "a|b|dev|rc";
    };
  };

  meta = {
    description = "Build LangChain applications with mistralai";
    homepage = "https://github.com/langchain-ai/langchain/tree/master/libs/partners/mistralai";
    license = lib.licenses.mit;
    maintainers = [
      lib.maintainers.sarahec
    ];
  };
})
