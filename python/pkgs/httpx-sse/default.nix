{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  httpx,
  setuptools-scm,
  setuptools,
}:

buildPythonPackage rec {
  pname = "httpx-sse";
  version = "0.4.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "florimondmanca";
    repo = "httpx-sse";
    tag = version;
    hash = "sha256-6DPbfJlbLmws9GkQ2zePGp4g0at4M32vrIDtmUPDkX4=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ httpx ];

  pythonImportsCheck = [ "httpx_sse" ];

  meta = {
    description = "Consume Server-Sent Event (SSE) messages with HTTPX";
    homepage = "https://github.com/florimondmanca/httpx-sse";
    license = lib.licenses.mit;
  };
}
