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
  version = "3.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sysid";
    repo = "sse-starlette";
    tag = "v${version}";
    hash = "sha256-SqYLwbl+AyeqgYIwAd/Z39BSPXaYSXMnM6DAGUv3vQ8=";
  };

  build-system = [ setuptools ];

  dependencies = [
    anyio
  ];

  optional-dependencies = {
    examples = [
      aiosqlite
      fastapi
      sqlalchemy
      starlette
      uvicorn
    ] ++ sqlalchemy.optional-dependencies.asyncio;
    uvicorn = [ uvicorn ];
  };

  pythonImportsCheck = [ "sse_starlette" ];

  meta = {
    description = "Server Sent Events for Starlette and FastAPI";
    homepage = "https://github.com/sysid/sse-starlette";
    license = lib.licenses.bsd3;
  };
}
