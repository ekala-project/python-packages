{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  pdm-backend,

  # dependencies
  pydantic,

  # optional-dependencies
  opentelemetry-sdk,

  # tests
  pytest-asyncio,
}:

buildPythonPackage (finalAttrs: {
  pname = "agent-client-protocol";
  version = "0.10.1";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "agentclientprotocol";
    repo = "python-sdk";
    tag = finalAttrs.version;
    hash = "sha256-iVmNzAx/YlvFXXVPjS1SmjDqGAr9aRDdSW93Nw2ayAY=";
  };

  build-system = [
    pdm-backend
  ];

  dependencies = [
    pydantic
  ];

  optional-dependencies = {
    logfire = [
      # logfire (unpackaged)
      opentelemetry-sdk
    ];
  };

  pythonImportsCheck = [ "acp" ];
  meta = {
    description = "Python SDK for ACP clients and agents";
    homepage = "https://github.com/agentclientprotocol/python-sdk";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
