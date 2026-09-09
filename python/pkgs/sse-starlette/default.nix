{
  lib,
  aiosqlite,
  anyio,
  buildPythonPackage,
  fastapi,
  fetchFromGitHub,
  setuptools,
  sqlalchemy,
  starlette,
  uvicorn,
}:

buildPythonPackage rec {
  pname = "sse-starlette";
  version = "3.4.11";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sysid";
    repo = "sse-starlette";
    tag = "v${version}";
    hash = "sha256-fdI/SxJgUDEyB1UJd9PLS6/TxvXZLlTAQFnr1UIBQRU=";
  };

  build-system = [ setuptools ];

  dependencies = [
    anyio
    starlette
  ];

  optional-dependencies = {
    examples = [
      aiosqlite
      fastapi
      sqlalchemy
      starlette
      uvicorn
    ]
    ++ sqlalchemy.optional-dependencies.asyncio;
    uvicorn = [ uvicorn ];
  };

  pythonImportsCheck = [ "sse_starlette" ];

  meta = {
    description = "Server Sent Events for Starlette and FastAPI";
    homepage = "https://github.com/sysid/sse-starlette";
    license = lib.licenses.bsd3;
  };
}
