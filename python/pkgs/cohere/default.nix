{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  poetry-core,

  # dependencies
  fastavro,
  httpx,
  pydantic,
  pydantic-core,
  requests,
  tokenizers,
  types-requests,
  typing-extensions,

  # optional-dependencies
  aiohttp,
  httpx-aiohttp,
  oci,
}:

buildPythonPackage rec {
  pname = "cohere";
  version = "7.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "cohere-ai";
    repo = "cohere-python";
    tag = version;
    hash = "sha256-7dkU2M9v7JbQU9OMUQA1yLzbCmRPuOzUmB6KBpO7EG0=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    fastavro
    httpx
    pydantic
    pydantic-core
    requests
    tokenizers
    types-requests
    typing-extensions
  ];

  pythonRelaxDeps = [
    "pydantic-core"
  ];

  optional-dependencies = {
    aiohttp = [
      aiohttp
      httpx-aiohttp
    ];
    oci = [ oci ];
  };

  # tests require CO_API_KEY
  doCheck = false;

  pythonImportsCheck = [ "cohere" ];

  meta = {
    description = "Simplify interfacing with the Cohere API";
    homepage = "https://docs.cohere.com/docs";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
