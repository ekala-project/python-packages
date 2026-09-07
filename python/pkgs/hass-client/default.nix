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

buildPythonPackage rec {
  pname = "hass-client";
  version = "1.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "music-assistant";
    repo = "python-hass-client";
    tag = version;
    hash = "sha256-WpsdvwRICAllrmpuhOUEAPq2kdtcKK/XgE+0+PY+lUo=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "1.0.0" "${version}"
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
  doCheck = false;

  meta = {
    description = "Basic client for connecting to Home Assistant over websockets and REST";
    homepage = "https://github.com/music-assistant/python-hass-client";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
