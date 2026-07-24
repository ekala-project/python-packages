{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,
  hatch-fancy-pypi-readme,

  # dependencies
  anyio,
  distro,
  httpx,
  jiter,
  pydantic,
  sniffio,
  tqdm,
  typing-extensions,

  # optional-dependencies (aiohttp)
  aiohttp,

  # optional-dependencies (datalib)
  numpy,
  pandas,
  pandas-stubs,

  # optional-dependencies (realtime)
  websockets,

  # optional-dependencies toggle
  withAiohttp ? true,
  withDatalib ? false,
  withRealtime ? true,
}:

buildPythonPackage rec {
  pname = "openai";
  version = "2.48.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "openai";
    repo = "openai-python";
    tag = "v${version}";
    hash = "sha256-LB88y4psz1yxtNcw+MeDW3IRn4zGF8U9DRImLbT/Xxk=";
  };

  postPatch = ''substituteInPlace pyproject.toml --replace-fail "hatchling==1.26.3" "hatchling"'';

  build-system = [
    hatchling
    hatch-fancy-pypi-readme
  ];

  dependencies = [
    anyio
    distro
    httpx
    jiter
    pydantic
    sniffio
    tqdm
    typing-extensions
  ]
  ++ lib.optionals withAiohttp optional-dependencies.aiohttp
  ++ lib.optionals withDatalib optional-dependencies.datalib
  ++ lib.optionals withRealtime optional-dependencies.realtime;

  optional-dependencies = {
    aiohttp = [
      aiohttp
    ];
    datalib = [
      numpy
      pandas
      pandas-stubs
    ];
    realtime = [
      websockets
    ];
  };

  pythonImportsCheck = [ "openai" ];

  meta = {
    description = "Python client library for the OpenAI API";
    homepage = "https://github.com/openai/openai-python";
    license = lib.licenses.asl20;
    mainProgram = "openai";
  };
}
