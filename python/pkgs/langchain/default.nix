{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  langchain-core,
  langgraph,
  pydantic,

  # Optional dependencies
  langchain-anthropic,
  langchain-community,
  langchain-google-genai,
  langchain-groq,
  langchain-mistralai,
  langchain-ollama,

  # runtime
  runtimeShell,
}:

buildPythonPackage (finalAttrs: {
  pname = "langchain";
  version = "1.3.13";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "langchain-ai";
    repo = "langchain";
    tag = "langchain==${finalAttrs.version}";
    hash = "sha256-KOid+tspI5cIcMl9SyACTClamY/Bs7xOi9n/zikbHiw=";
  };

  sourceRoot = "${finalAttrs.src.name}/libs/langchain_v1";

  postPatch = ''
    substituteInPlace langchain/agents/middleware/shell_tool.py \
      --replace-fail '"/bin/bash"' '"${runtimeShell}"'
  '';

  build-system = [ hatchling ];

  dependencies = [
    langchain-core
    langgraph
    pydantic
  ];

  optional-dependencies = {
    anthropic = [ langchain-anthropic ];
    community = [ langchain-community ];
    google-genai = [ langchain-google-genai ];
    groq = [ langchain-groq ];
    mistralai = [ langchain-mistralai ];
    ollama = [ langchain-ollama ];
  };

  passthru = {
    skipBulkUpdate = true;
  };

  pythonImportsCheck = [ "langchain" ];

  meta = {
    description = "Building applications with LLMs through composability";
    homepage = "https://github.com/langchain-ai/langchain";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
