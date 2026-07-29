{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  click,
  httpx,
  langgraph-runtime-inmem,
  langgraph-sdk,
  langgraph,
  pathspec,
  python-dotenv,

}:

buildPythonPackage (finalAttrs: {
  pname = "langgraph-cli";
  version = "0.4.31";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "langchain-ai";
    repo = "langgraph";
    tag = "cli==${finalAttrs.version}";
    hash = "sha256-9q+/IKQcNT04WVSGU+ByoLxAPiUSbxPBhqI5uxpobHk=";
  };

  sourceRoot = "${finalAttrs.src.name}/libs/cli";

  build-system = [ hatchling ];

  dependencies = [
    click
    httpx
    langgraph-sdk
    pathspec
    python-dotenv
  ];

  optional-dependencies = {
    "inmem" = [
      langgraph
      langgraph-runtime-inmem
      python-dotenv
    ];
  };

  pythonImportsCheck = [ "langgraph_cli" ];

  passthru = {
    skipBulkUpdate = true;
  };

  meta = {
    description = "Official CLI for LangGraph API";
    homepage = "https://github.com/langchain-ai/langgraph/tree/main/libs/cli";
    mainProgram = "langgraph";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
