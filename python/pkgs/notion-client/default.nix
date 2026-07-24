{
  lib,
  anyio,
  buildPythonPackage,
  fetchFromGitHub,
  httpx,
  pytest-asyncio,
  pytest-cov-stub,
  pytest-vcr,
  setuptools,
}:

buildPythonPackage rec {
  pname = "notion-client";
  version = "2.7.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ramnes";
    repo = "notion-sdk-py";
    tag = version;
    hash = "sha256-15IPycaLk8r0/bUphL+IDypBMhgdX1tAUS50VD3p/00=";
  };

  build-system = [ setuptools ];

  dependencies = [ httpx ];
  pythonImportsCheck = [ "notion_client" ];
  meta = {
    description = "Python client for the official Notion API";
    homepage = "https://github.com/ramnes/notion-sdk-py";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
