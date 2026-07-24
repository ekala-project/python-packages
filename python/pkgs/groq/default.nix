{
  lib,
  aiohttp,
  anyio,
  buildPythonPackage,
  dirty-equals,
  distro,
  fetchFromGitHub,
  hatch-fancy-pypi-readme,
  hatchling,
  httpx-aiohttp,
  httpx,
  nest-asyncio,
  pydantic,
  pytest-asyncio,
  pytest-xdist,
  respx,
  sniffio,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "groq";
  version = "1.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "groq";
    repo = "groq-python";
    tag = "v${version}";
    hash = "sha256-WtibHngPubo4p+xtdvqqDTvRFMk+dSBmxjoQxVPyXQM=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "hatchling==1.26.3" \
      "hatchling>=1.26.3"
  '';

  build-system = [
    hatch-fancy-pypi-readme
    hatchling
  ];

  dependencies = [
    anyio
    distro
    httpx
    pydantic
    sniffio
    typing-extensions
  ];

  optional-dependencies = {
    aiohttp = [
      aiohttp
      httpx-aiohttp
    ];
  };
  meta = {
    description = "Library for the Groq API";
    homepage = "https://github.com/groq/groq-python";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
