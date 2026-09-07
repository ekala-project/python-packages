{
  # Basic
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # Build system
  setuptools,
  # Dependencies
  aiohttp,
  certifi,
  cryptography,
  httpx,
  httpx-sse,
  requests,
  rich,
  typer,
  typing-extensions,
  websocket-client,
}:

buildPythonPackage rec {
  pname = "dashscope";
  version = "1.27.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dashscope";
    repo = "dashscope-sdk-python";
    tag = "v${version}";
    hash = "sha256-oLg/ghUllfsS/2Aqu6QrkBnQYxsBshZlWPHg+UZp6Yw=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aiohttp
    certifi
    cryptography
    httpx
    httpx-sse
    requests
    rich
    typer
    typing-extensions
    websocket-client
  ];

  # Specify the version explicitly
  postPatch = ''
    substituteInPlace setup.py \
      --replace-fail "version=get_version()," "version='${version}',"
  '';
  pythonImportsCheck = [ "dashscope" ];
  meta = {
    description = "Python SDK for dashscope";
    homepage = "https://github.com/dashscope/dashscope-sdk-python";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
