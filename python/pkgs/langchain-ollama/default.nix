{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  langchain-core,
  ollama,

  # testing
  langchain-tests,
  pytest-asyncio,
  pytest-socket,
  syrupy,

  # passthru
  gitUpdater,
}:

buildPythonPackage (finalAttrs: {
  pname = "langchain-ollama";
  version = "1.1.0";
  pyproject = true;
  __structuredAttrs = true;
  strictDeps = true;

  src = fetchFromGitHub {
    owner = "langchain-ai";
    repo = "langchain";
    tag = "langchain-ollama==${finalAttrs.version}";
    hash = "sha256-4MbrfHf/ElBFR9cXIx+spQB+xsw2aj94IBJ5hcB6SJ0=";
  };

  sourceRoot = "${finalAttrs.src.name}/libs/partners/ollama";

  build-system = [
    hatchling
  ];

  dependencies = [
    langchain-core
    ollama
  ];
  pythonImportsCheck = [ "langchain_ollama" ];

  passthru = {
    # python updater script sets the wrong tag
    skipBulkUpdate = true;
    updateScript = gitUpdater {
      rev-prefix = "langchain-ollama==";
      ignoredVersions = "a|b|dev|rc";
    };
  };

  meta = {
    description = "Integration package connecting Ollama and LangChain";
    homepage = "https://github.com/langchain-ai/langchain/tree/master/libs/partners/ollama";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
