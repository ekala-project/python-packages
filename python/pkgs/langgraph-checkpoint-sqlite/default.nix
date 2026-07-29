{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build system
  hatchling,

  # dependencies
  aiosqlite,
  langgraph-checkpoint,
  sqlite-vec,

}:

buildPythonPackage (finalAttrs: {
  pname = "langgraph-checkpoint-sqlite";
  version = "3.1.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "langchain-ai";
    repo = "langgraph";
    tag = "checkpointsqlite==${finalAttrs.version}";
    hash = "sha256-xSYJ9D86GuaJEgQYk+pkJ4O7HK6HXfAOGBv4f1CBY5g=";
  };

  sourceRoot = "${finalAttrs.src.name}/libs/checkpoint-sqlite";

  build-system = [ hatchling ];

  dependencies = [
    aiosqlite
    langgraph-checkpoint
    sqlite-vec
  ];

  pythonRelaxDeps = [
    "aiosqlite"
    "sqlite-vec"
    "langgraph-checkpoint"
  ];

  pythonImportsCheck = [ "langgraph.checkpoint.sqlite" ];

  passthru = {
    skipBulkUpdate = true;
  };

  meta = {
    description = "Library with a SQLite implementation of LangGraph checkpoint saver";
    homepage = "https://github.com/langchain-ai/langgraph/tree/main/libs/checkpoint-sqlite";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
