{
  buildPythonPackage,
  charset-normalizer,
  fetchFromGitHub,
  hatchling,
  lib,
  orjson,
  urllib3-future,
  wassima,
}:

buildPythonPackage (finalAttrs: {
  pname = "niquests";
  version = "3.21.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jawah";
    repo = "niquests";
    tag = "v${finalAttrs.version}";
    hash = "sha256-HhV7gG++e6AG6oQQvedJBB+c9OcPSyDGr8hFUoqm2h0=";
  };

  build-system = [ hatchling ];

  dependencies = [
    charset-normalizer
    urllib3-future
    wassima
  ];

  optional-dependencies = {
    inherit (urllib3-future.optional-dependencies)
      brotli
      socks
      ws
      zstd
      ;
    full = [
      orjson
    ]
    ++ urllib3-future.optional-dependencies.zstd
    ++ urllib3-future.optional-dependencies.brotli
    ++ urllib3-future.optional-dependencies.ws
    ++ urllib3-future.optional-dependencies.socks;
    http3 = urllib3-future.optional-dependencies.qh3;
    ocsp = urllib3-future.optional-dependencies.qh3;
    speedups = [
      orjson
    ]
    ++ urllib3-future.optional-dependencies.zstd
    ++ urllib3-future.optional-dependencies.brotli;
  };

  pythonImportsCheck = [ "niquests" ];

  meta = {
    description = "Simple HTTP library that is a drop-in replacement for Requests";
    homepage = "https://github.com/jawah/niquests";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
