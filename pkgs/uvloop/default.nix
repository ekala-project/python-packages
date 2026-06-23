{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  cython,
  setuptools,

  # native dependencies
  libuv,
}:

buildPythonPackage rec {
  pname = "uvloop";
  version = "0.22.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "MagicStack";
    repo = "uvloop";
    tag = "v${version}";
    hash = "sha256-9NJugzxFycr1LLZXiDKbpeVcIvlCPHHIcYMp8jmffuE=";
  };

  postPatch = ''
    rm -rf vendor

    substituteInPlace setup.py \
      --replace-fail "use_system_libuv = False" "use_system_libuv = True"
  '';

  build-system = [
    cython
    setuptools
  ];

  env.LIBUV_CONFIGURE_HOST = stdenv.hostPlatform.config;

  buildInputs = [ libuv ];

  pythonImportsCheck = [
    "uvloop"
    "uvloop.loop"
  ];

  meta = {
    description = "Fast implementation of asyncio event loop on top of libuv";
    homepage = "https://github.com/MagicStack/uvloop";
    license = lib.licenses.mit;
  };
}
