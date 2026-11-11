{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  griffelib,
  mcp,
  openai,
  pydantic,
  requests,
  types-requests,
  typing-extensions,
  websockets,
}:

buildPythonPackage (finalAttrs: {
  pname = "openai-agents";
  version = "0.24.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) version;
    pname = "openai_agents";
    hash = "sha256-S0soX0/tgf3xtKxCapEBZY2c0ptPsaru4Y9jm3fnBOM=";
  };

  build-system = [
    hatchling
  ];

  # openai-agents 0.24.0 pins openai>=3, but every core module imports fine
  # against openai 2.x. pyjwt and urllib3 are only "security floor" pins on
  # transitive dependencies.
  pythonRelaxDeps = [
    "openai"
    "pyjwt"
    "urllib3"
    "websockets"
  ];

  dependencies = [
    griffelib
    mcp
    openai
    pydantic
    requests
    types-requests
    typing-extensions
    websockets
  ];

  pythonImportsCheck = [
    "agents"
  ];

  meta = {
    homepage = "https://github.com/openai/openai-agents-python";
    description = "Lightweight, powerful framework for multi-agent workflows";
    license = lib.licenses.mit;
  };
})
