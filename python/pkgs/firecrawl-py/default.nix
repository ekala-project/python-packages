{
  lib,
  aiohttp,
  buildPythonPackage,
  fetchFromGitHub,
  httpx,
  nest-asyncio,
  pydantic,
  python-dotenv,
  requests,
  setuptools,
  websockets,
}:

buildPythonPackage (finalAttrs: {
  pname = "firecrawl-py";
  version = "2.11.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mendableai";
    repo = "firecrawl";
    tag = "v${finalAttrs.version}";
    hash = "sha256-U4RSwdT6ogA2yf9oR2u98zWC6nWtBFmHCuU6FgLNqSw=";
  };

  sourceRoot = "${finalAttrs.src.name}/apps/python-sdk";

  build-system = [ setuptools ];

  dependencies = [
    aiohttp
    httpx
    nest-asyncio
    pydantic
    python-dotenv
    requests
    websockets
  ];

  # No tests
  doCheck = false;

  pythonImportsCheck = [ "firecrawl" ];

  meta = {
    description = "Turn entire websites into LLM-ready markdown or structured data. Scrape, crawl and extract with a single API";
    homepage = "https://firecrawl.dev";
    license = lib.licenses.mit;
  };
})
