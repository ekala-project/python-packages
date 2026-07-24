{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  jsonpatch,
  langchain-protocol,
  langsmith,
  packaging,
  pydantic,
  pyyaml,
  tenacity,
  typing-extensions,
  uuid-utils,

  # tests
  blockbuster,
  freezegun,
  grandalf,
  langchain-core,
  langchain-tests,
  numpy,
  pytest-asyncio,
  pytest-mock,
  pytest-xdist,
  syrupy,

  # passthru
  gitUpdater,
}:

buildPythonPackage (finalAttrs: {
  pname = "langchain-core";
  version = "1.4.9";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "langchain-ai";
    repo = "langchain";
    tag = "langchain-core==${finalAttrs.version}";
    hash = "sha256-yOsft14mHlIaDQj2bhBAUISZCVXsyEtyNC9B7+5F0Oo=";
  };

  sourceRoot = "${finalAttrs.src.name}/libs/core";

  build-system = [ hatchling ];

  dependencies = [
    jsonpatch
    langchain-protocol
    langsmith
    packaging
    pydantic
    pyyaml
    tenacity
    typing-extensions
    uuid-utils
  ];

  pythonImportsCheck = [ "langchain_core" ];

  # avoid infinite recursion
  doCheck = false;
  passthru = {
    tests.pytest = langchain-core.overridePythonAttrs (_: {
    });
    # python updater script sets the wrong tag
    skipBulkUpdate = true;
    updateScript = gitUpdater {
      rev-prefix = "langchain-core==";
      ignoredVersions = "a|b|dev|rc";
    };
  };
  meta = {
    description = "Building applications with LLMs through composability";
    homepage = "https://github.com/langchain-ai/langchain/tree/master/libs/core";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
