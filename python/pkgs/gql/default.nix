{
  lib,
  aiofiles,
  aiohttp,
  anyio,
  backoff,
  botocore,
  buildPythonPackage,
  fetchFromGitHub,
  graphql-core,
  httpx,
  requests,
  requests-toolbelt,
  setuptools,
  websockets,
  yarl,
}:

buildPythonPackage rec {
  pname = "gql";
  version = "4.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "graphql-python";
    repo = "gql";
    tag = "v${version}";
    hash = "sha256-bPdlFN6MRT6G9Mw2g2BBfsOGpQmT7pbRatpqa7CImSs=";
  };

  build-system = [ setuptools ];

  dependencies = [
    anyio
    backoff
    graphql-core
    yarl
  ];
  optional-dependencies = {
    all = [
      aiofiles
      aiohttp
      botocore
      httpx
      requests
      requests-toolbelt
      websockets
    ];
    aiofiles = [ aiofiles ];
    aiohttp = [ aiohttp ];
    httpx = [ httpx ];
    requests = [
      requests
      requests-toolbelt
    ];
    websockets = [ websockets ];
    botocore = [ botocore ];
  };
  disabledTestMarks = [
    "online"
  ];

  pythonImportsCheck = [ "gql" ];
  meta = {
    description = "GraphQL client in Python";
    homepage = "https://github.com/graphql-python/gql";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "gql-cli";
  };
}
