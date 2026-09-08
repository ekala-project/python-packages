{
  lib,
  stdenv,
  aiofiles,
  aioquic,
  beautifulsoup4,
  buildPythonPackage,
  fetchFromGitHub,
  gunicorn,
  html5tagger,
  httptools,
  multidict,
  pytest-asyncio,
  sanic-ext,
  sanic-routing,
  sanic-testing,
  setuptools,
  tracerite,
  typing-extensions,
  ujson,
  uvicorn,
  uvloop,
  websockets,
}:

buildPythonPackage rec {
  pname = "sanic";
  version = "25.12.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sanic-org";
    repo = "sanic";
    tag = "v${version}";
    hash = "sha256-0P5UyLi9W5maoR1EpRxfhysckDWpjgmqndgxsVHm47c=";
  };

  # test compat for testing with pytest-asyncio
  patches = [ ./pytest9-compat.patch ];

  build-system = [ setuptools ];

  dependencies = [
    aiofiles
    httptools
    html5tagger
    multidict
    sanic-routing
    tracerite
    typing-extensions
    ujson
    uvloop
    websockets
  ];

  optional-dependencies = {
    ext = [ sanic-ext ];
    http3 = [ aioquic ];
  };
  # Avoid usage of nixpkgs-review in darwin since tests will compete usage
  # for the same local port
  pythonImportsCheck = [ "sanic" ];

  meta = {
    description = "Web server and web framework";
    homepage = "https://github.com/sanic-org/sanic/";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "sanic";
  };
}
