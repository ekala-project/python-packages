{
  lib,
  anyio,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  mcp,
  pytest-asyncio,
  pytest-cov-stub,
  sniffio,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "claude-agent-sdk";
  version = "0.2.152";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "anthropics";
    repo = "claude-agent-sdk-python";
    tag = "v${finalAttrs.version}";
    hash = "sha256-h3LjBolK1hpcATNX45ftYZBTKWQtSF34o78E6fRab2M=";
  };

  build-system = [ hatchling ];

  dependencies = [
    anyio
    mcp
    sniffio
    typing-extensions
  ];
  pythonImportsCheck = [ "claude_agent_sdk" ];
  meta = {
    description = "Python SDK for Claude Agent";
    homepage = "https://github.com/anthropics/claude-agent-sdk-python";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
