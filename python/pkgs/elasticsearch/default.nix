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

buildPythonPackage rec {
  pname = "elasticsearch";
  version = "9.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-w3V2ugTQQgCgUBLbmbyZAkAArhW5691oOWaqig5s0cQ=";
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

  doCheck = false;

  meta = {
    description = "Official low-level client for Elasticsearch";
    homepage = "https://github.com/elasticsearch/elasticsearch-py";
    license = lib.licenses.asl20;
  };
}
