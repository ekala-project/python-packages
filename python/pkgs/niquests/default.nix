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
  version = "3.21.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jawah";
    repo = "niquests";
    tag = "v${finalAttrs.version}";
    hash = "sha256-oKxs1ivKzoCIqFnh81MwCbLfjH5JTKj/orTZNe7uiC4=";
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
    ];
    http3 = urllib3-future.optional-dependencies.qh3;
    ocsp = urllib3-future.optional-dependencies.qh3;
    speedups = [
      orjson
    ];
  };

  pythonImportsCheck = [ "niquests" ];

  meta = {
    description = "Simple HTTP library that is a drop-in replacement for Requests";
    homepage = "https://github.com/jawah/niquests";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
