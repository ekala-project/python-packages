{
  lib,
  aiohttp,
  anyio,
  buildPythonPackage,
  elastic-transport,
  fetchPypi,
  hatchling,
  orjson,
  pyarrow ? null,
  python-dateutil,
  requests,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "elasticsearch";
  version = "9.5.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-mCEM2WwlbdmTb1jhx2KrqU2n23040Fi7D7r35LlWcUY=";
  };

  build-system = [ hatchling ];

  dependencies = [
    anyio
    elastic-transport
    python-dateutil
    typing-extensions
  ];

  optional-dependencies = {
    requests = [ requests ];
    async = [ aiohttp ];
    orjson = [ orjson ];
    pyarrow = lib.optionals (pyarrow != null) [ pyarrow ];
  };

  pythonImportsCheck = [ "elasticsearch" ];

  meta = {
    description = "Official low-level client for Elasticsearch";
    homepage = "https://github.com/elasticsearch/elasticsearch-py";
    license = lib.licenses.asl20;
  };
})
