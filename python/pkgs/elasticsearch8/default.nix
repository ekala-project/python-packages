{
  lib,
  aiohttp,
  buildPythonPackage,
  elastic-transport,
  fetchFromGitHub,
  fetchPypi,
  hatchling,
  orjson,
  python-dateutil,
  requests,
  typing-extensions,
}:

let
  # elasticsearch8 requires elastic-transport<9
  elastic-transport_8 = elastic-transport.overridePythonAttrs (old: {
    version = "8.17.1";
    src = fetchFromGitHub {
      owner = "elastic";
      repo = "elastic-transport-python";
      tag = "v8.17.1";
      hash = "sha256-LWSvE88wEwMxRi6IZsMkIRP8UTRfImC9QZnuka1oiso=";
    };
  });
in
buildPythonPackage (finalAttrs: {
  pname = "elasticsearch8";
  version = "8.19.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-fv/pWzYCQbbVbvaCGQN6kK0PVnI2FNtUu+V9MwWEAvQ=";
  };

  build-system = [ hatchling ];

  dependencies = [
    elastic-transport_8
    python-dateutil
    typing-extensions
  ];

  optional-dependencies = {
    async = [ aiohttp ];
    requests = [ requests ];
    orjson = [ orjson ];
  };

  # Check is disabled because running them destroy the content of the local cluster!
  # https://github.com/elasticsearch/elasticsearch-py/tree/main/test_elasticsearch

  pythonImportsCheck = [ "elasticsearch8" ];

  meta = {
    description = "Official low-level client for Elasticsearch";
    homepage = "https://github.com/elasticsearch/elasticsearch-py";
    license = lib.licenses.asl20;
  };
})
