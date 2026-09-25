{
  lib,
  anyio,
  anysqlite,
  buildPythonPackage,
  fetchFromGitHub,
  fastapi,
  hatch-fancy-pypi-readme,
  hatchling,
  httpx,
  msgpack,
  redis,
  requests,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "hishel";
  version = "1.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "karpetrosyan";
    repo = "hishel";
    tag = version;
    hash = "sha256-KVfbWhGpbLGzK3fQOuT+KtBi13z5ZZBP8NOsIIfObMc=";
  };

  postPatch = ''
    sed -i "/addopts/d" pyproject.toml
  '';

  build-system = [
    hatch-fancy-pypi-readme
    hatchling
  ];

  dependencies = [
    msgpack
    typing-extensions
  ];

  optional-dependencies = {
    async = [
      anyio
      anysqlite
    ];
    requests = [ requests ];
    httpx = [ httpx ];
    fastapi = [ fastapi ];
    redis = [ redis ];
  };
  pythonImportsCheck = [ "hishel" ];

  meta = {
    description = "HTTP Cache implementation for HTTPX and HTTP Core";
    homepage = "https://github.com/karpetrosyan/hishel";
    license = lib.licenses.bsd3;
  };
}
