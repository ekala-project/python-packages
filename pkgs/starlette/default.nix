{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  anyio,

  # optional dependencies
  itsdangerous,
  jinja2,
  python-multipart,
  pyyaml,
  httpx,
}:

buildPythonPackage rec {
  pname = "starlette";
  version = "0.52.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "encode";
    repo = "starlette";
    tag = version;
    hash = "sha256-XPAeRnh9a0A1/5VGZzzGQBhlBsih1VR8QmFdkxG5cQE=";
  };

  build-system = [ hatchling ];

  dependencies = [ anyio ];

  optional-dependencies.full = [
    itsdangerous
    jinja2
    python-multipart
    pyyaml
    httpx
  ];

  pythonImportsCheck = [ "starlette" ];

  meta = {
    downloadPage = "https://github.com/encode/starlette";
    homepage = "https://www.starlette.io/";
    description = "Little ASGI framework that shines";
    license = lib.licenses.bsd3;
  };
}
