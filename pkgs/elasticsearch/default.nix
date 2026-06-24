{
  lib,
  aiohttp,
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
  version = "8.18.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-mYA18XqMH7p64msYPcp5fc+V24baan7LpW0xr8QPB8c=";
  };

  build-system = [ hatchling ];

  dependencies = [
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
