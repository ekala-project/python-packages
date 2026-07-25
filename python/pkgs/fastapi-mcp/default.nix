{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,
  tomli,

  # dependencies
  fastapi,
  httpx,
  mcp,
  pydantic,
  pydantic-settings,
  requests,
  rich,
  typer,
  uvicorn,
}:

buildPythonPackage rec {
  pname = "fastapi-mcp";
  version = "0.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tadata-org";
    repo = "fastapi_mcp";
    tag = "v${version}";
    hash = "sha256-TCmM5n6BF3CWEuGVSZnUL2rTYitKtn4vSCkiQvKFLKw=";
  };

  build-system = [
    hatchling
    tomli
  ];

  dependencies = [
    fastapi
    httpx
    mcp
    pydantic
    pydantic-settings
    requests
    rich
    tomli
    typer
    uvicorn
  ];

  pythonImportsCheck = [ "fastapi_mcp" ];
  meta = {
    description = "Expose your FastAPI endpoints as Model Context Protocol (MCP) tools, with Auth";
    homepage = "https://github.com/tadata-org/fastapi_mcp";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
