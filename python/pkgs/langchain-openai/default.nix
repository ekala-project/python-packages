{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  langchain-core,
  openai,
  tiktoken,

  # tests
  langchain,

  # passthru
  gitUpdater,
}:

buildPythonPackage (finalAttrs: {
  pname = "langchain-openai";
  version = "1.3.5";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "langchain-ai";
    repo = "langchain";
    tag = "langchain-openai==${finalAttrs.version}";
    hash = "sha256-kfzfMldzWdhR785rfNPwI2T0u9ep66diQWYJeTpsdCM=";
  };

  sourceRoot = "${finalAttrs.src.name}/libs/partners/openai";

  build-system = [ hatchling ];

  # The python3Packages.openai update has to go through staging, so be open to newer versions
  pythonRelaxDeps = [ "openai" ];

  dependencies = [
    langchain-core
    openai
    tiktoken
  ];
  pythonImportsCheck = [ "langchain_openai" ];

  passthru = {
    # python updater script sets the wrong tag
    skipBulkUpdate = true;
    updateScript = gitUpdater {
      rev-prefix = "langchain-openai==";
      ignoredVersions = "a|b|dev|rc";
    };
  };

  meta = {
    description = "Integration package connecting OpenAI and LangChain";
    homepage = "https://github.com/langchain-ai/langchain/tree/master/libs/partners/openai";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
