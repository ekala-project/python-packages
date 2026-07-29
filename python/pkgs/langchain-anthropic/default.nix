{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  anthropic,
  langchain-core,
  pydantic,

}:

buildPythonPackage (finalAttrs: {
  pname = "langchain-anthropic";
  version = "1.4.8";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "langchain-ai";
    repo = "langchain";
    tag = "langchain-anthropic==${finalAttrs.version}";
    hash = "sha256-MX+DhFEkRNZ3IEKMXFT61XR6hEx2WPdGGaA0b/KlPZE=";
  };

  sourceRoot = "${finalAttrs.src.name}/libs/partners/anthropic";

  build-system = [ hatchling ];

  # Langchain always tracks the latest release of anthropic whether or not it's needed
  pythonRelaxDeps = [ "anthropic" ];

  dependencies = [
    anthropic
    langchain-core
    pydantic
  ];
  pythonImportsCheck = [ "langchain_anthropic" ];

  passthru = {
    # python updater script sets the wrong tag
    skipBulkUpdate = true;
  };

  meta = {
    description = "Build LangChain applications with Anthropic";
    homepage = "https://github.com/langchain-ai/langchain/tree/master/libs/partners/anthropic";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
