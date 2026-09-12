{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pythonAtLeast,

  # build-system
  hatchling,

  # dependencies
  aiohttp,
  httpx-sse,
  langchain-classic,
  langchain-core,
  langsmith,
  numpy,
  pydantic-settings,
  pyyaml,
  requests,
  sqlalchemy,
  tenacity,

  # tests

  # passthru
  gitUpdater,
}:

buildPythonPackage rec {
  pname = "langchain-community";
  version = "0.4.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "langchain-ai";
    repo = "langchain-community";
    tag = "libs/community/v${version}";
    hash = "sha256-I9xULsg+tlXM3Brh6Xa5xvFENx8zn4FRZ1/evNEh8UY=";
  };

  sourceRoot = "${src.name}/libs/community";

  build-system = [ hatchling ];

  # Only needed for mixed python 3.12/3.13 builds
  pythonRelaxDeps = [
    "numpy"
  ];

  dependencies = [
    aiohttp
    httpx-sse
    langchain-classic
    langchain-core
    langsmith
    numpy
    pydantic-settings
    pyyaml
    requests
    sqlalchemy
    tenacity
  ];

  pythonImportsCheck = [ "langchain_community" ];
  passthru.updateScript = gitUpdater {
    rev-prefix = "libs/community/v";
    ignoredVersions = "a|b|dev|rc";
  };

  meta = {
    description = "Community contributed LangChain integrations";
    homepage = "https://github.com/langchain-ai/langchain-community";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
