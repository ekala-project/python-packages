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
  version = "3.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ramnes";
    repo = "notion-sdk-py";
    tag = version;
    hash = "sha256-TdBynMSx8VWzJY9j/AeKLivVzpSoCWavn6bW9p804Jw=";
  };

  build-system = [ setuptools ];

  dependencies = [ httpx ];
  pythonImportsCheck = [ "notion_client" ];
  meta = {
    description = "Python client for the official Notion API";
    homepage = "https://github.com/ramnes/notion-sdk-py";
    license = lib.licenses.mit;
  };
}
