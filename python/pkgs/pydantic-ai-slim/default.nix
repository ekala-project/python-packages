{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  hatchling,
  uv-dynamic-versioning,

  # dependencies
  anyio,
  genai-prices,
  griffelib,
  httpx2,
  opentelemetry-api,
  pydantic-graph,
  pydantic,
  typing-inspection,

}:

buildPythonPackage (finalAttrs: {
  pname = "pydantic-ai-slim";
  version = "2.67.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pydantic";
    repo = "pydantic-ai";
    tag = "v${finalAttrs.version}";
    hash = "sha256-iOev1nXKvuxk4pWyWhzljF07cvBYLWpQzPuyqNqHMdw=";
  };

  sourceRoot = "${finalAttrs.src.name}/pydantic_ai_slim";

  build-system = [
    hatchling
    uv-dynamic-versioning
  ];

  # genai-prices in this package set lags behind upstream's lower bound
  pythonRelaxDeps = [ "genai-prices" ];

  dependencies = [
    anyio
    genai-prices
    griffelib
    httpx2
    opentelemetry-api
    # pydantic-ai-slim pins pydantic-graph to the exact same version; both are
    # built from the same monorepo, so build it from the same source here.
    (pydantic-graph.overridePythonAttrs {
      inherit (finalAttrs) version src;
      sourceRoot = "${finalAttrs.src.name}/pydantic_graph";
      dependencies = pydantic-graph.dependencies ++ [ anyio ];
    })
    pydantic
    typing-inspection
  ];

  pythonImportsCheck = [
    "pydantic_ai"
  ];

  meta = {
    description = "GenAI Agent Framework, the Pydantic way";
    homepage = "https://github.com/pydantic/pydantic-ai";
    license = lib.licenses.mit;
  };
})
