{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  aiofiles,
  asgi-csrf,
  click,
  click-default-group,
  flexcache,
  flexparser,
  httpx,
  hupper,
  itsdangerous,
  janus,
  jinja2,
  mergedeep,
  platformdirs,
  pluggy,
  pyyaml,
  typing-extensions,
  uvicorn,
  pytest-asyncio,
  pytest-timeout,
  aiohttp,
  beautifulsoup4,
  asgiref,
  setuptools,
  trustme,
}:

buildPythonPackage rec {
  pname = "datasette";
  version = "0.65.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "simonw";
    repo = "datasette";
    tag = version;
    hash = "sha256-9ZMQ9xpWalkM4Ymoc/IA0ct+0r8ht1TxW5qPlVMFspE=";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace '"pytest-runner"' ""
  '';

  build-system = [ setuptools ];

  pythonRemoveDeps = [
    "pip"
    "setuptools"
  ];

  dependencies = [
    aiofiles
    asgi-csrf
    asgiref
    click
    click-default-group
    flexcache
    flexparser
    httpx
    hupper
    itsdangerous
    janus
    jinja2
    mergedeep
    platformdirs
    pluggy
    pyyaml
    setuptools
    typing-extensions
    uvicorn
  ];
  # takes 30-180 mins to run entire test suite, not worth the CPU resources, slows down reviews
  # with pytest-xdist, it still takes around 10 mins with 32 cores
  # just run the csv tests, as this should give some indictation of correctness
  pythonImportsCheck = [
    "datasette"
    "datasette.cli"
    "datasette.app"
    "datasette.database"
    "datasette.renderer"
    "datasette.tracer"
    "datasette.plugins"
  ];

  meta = {
    description = "Multi-tool for exploring and publishing data";
    mainProgram = "datasette";
    homepage = "https://datasette.io/";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
