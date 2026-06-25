{
  aiohttp,
  anyio,
  buildPythonPackage,
  distro,
  fetchFromGitHub,
  google-auth,
  httpx,
  lib,
  packaging,
  pkginfo,
  pydantic,
  requests,
  setuptools,
  sniffio,
  tenacity,
  typing-extensions,
  websockets,
}:

buildPythonPackage rec {
  pname = "google-genai";
  version = "1.67.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "googleapis";
    repo = "python-genai";
    tag = "v${version}";
    hash = "sha256-1ewVg271kooPkCEtmDm1HHnJY3MkomrXKp1dK9J0RXI=";
  };

  build-system = [
    packaging
    pkginfo
    setuptools
  ];

  pythonRelaxDeps = [
    "tenacity"
    "websockets"
  ];

  dependencies = [
    anyio
    distro
    google-auth
    httpx
    pydantic
    requests
    sniffio
    tenacity
    typing-extensions
    websockets
  ];

  optional-dependencies = {
    aiohttp = [ aiohttp ];
  };

  pythonImportsCheck = [ "google.genai" ];

  # ValueError: GOOGLE_GENAI_REPLAYS_DIRECTORY environment variable is not set
  doCheck = false;

  meta = {
    description = "Google Generative AI Python SDK";
    homepage = "https://github.com/googleapis/python-genai";
    license = lib.licenses.asl20;
  };
}
