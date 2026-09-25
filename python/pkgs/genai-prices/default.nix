{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  httpx2,
  pydantic,
}:

buildPythonPackage (finalAttrs: {
  pname = "genai-prices";
  version = "0.0.71";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pydantic";
    repo = "genai-prices";
    tag = "v${finalAttrs.version}";
    hash = "sha256-IFBdpXJ0AE3UNNqUlOrYMIgRGeB87BYbNqb4GvtJkl0=";
  };

  sourceRoot = "${finalAttrs.src.name}/packages/python";

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'requires = ["uv_build>=0.8.10"]' 'requires = ["hatchling"]' \
      --replace-fail 'build-backend = "uv_build"' 'build-backend = "hatchling.build"'
  '';

  build-system = [
    hatchling
  ];

  dependencies = [
    httpx2
    pydantic
  ];

  pythonImportsCheck = [
    "genai_prices"
  ];

  doCheck = false; # no tests

  meta = {
    description = "Calculate prices for calling LLM inference APIs";
    homepage = "https://github.com/pydantic/genai-prices";
    license = lib.licenses.mit;
  };
})
