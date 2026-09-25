{
  lib,
  anyio,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  httpcore,
  httpx,
  pytest-cov-stub,
  starlette,
  trio,
  uvicorn,
  wsproto,
}:

buildPythonPackage rec {
  pname = "httpx-ws";
  version = "0.9.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "frankie567";
    repo = "httpx-ws";
    tag = "v${version}";
    hash = "sha256-e6D3sU6eWjsZnURIv1WfkSr54AMdDP9kHd263awzNsI=";
  };

  # we don't need to use the hatch-regex-commit plugin
  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'source = "regex_commit"' "" \
      --replace-fail 'commit_extra_args = ["-e"]' "" \
      --replace-fail '"hatch-regex-commit"' ""
  '';

  build-system = [ hatchling ];

  dependencies = [
    anyio
    httpcore
    httpx
    wsproto
  ];
  pythonImportsCheck = [ "httpx_ws" ];
  meta = {
    description = "WebSocket support for HTTPX";
    homepage = "https://github.com/frankie567/httpx-ws";
    license = lib.licenses.mit;
  };
}
