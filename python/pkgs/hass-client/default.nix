{
  aiodns,
  aiohttp,
  brotli,
  buildPythonPackage,
  faust-cchardet,
  fetchFromGitHub,
  lib,
  orjson,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "hass-client";
  version = "1.4.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "music-assistant";
    repo = "python-hass-client";
    tag = finalAttrs.version;
    hash = "sha256-iZ3ZRNQJBhiewW1KYSVaHZjpH3ou+0o1HV2wlnhQeio=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "1.0.0" "${finalAttrs.version}"
  '';

  build-system = [
    setuptools
  ];

  dependencies = [
    aiohttp
  ];

  optional-dependencies = {
    speedups = [
      aiodns
      brotli
      faust-cchardet
      orjson
    ];
  };

  pythonImportsCheck = [
    "hass_client"
  ];

  # upstream has no tests

  meta = {
    description = "Basic client for connecting to Home Assistant over websockets and REST";
    homepage = "https://github.com/music-assistant/python-hass-client";
    license = lib.licenses.asl20;
  };
})
