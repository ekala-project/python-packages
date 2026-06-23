{
  lib,
  brotli,
  buildPythonPackage,
  pkgconfig,
  setuptools,
}:

buildPythonPackage rec {
  pname = "brotli";
  inherit (brotli) version src;
  pyproject = true;

  build-system = [
    pkgconfig
    setuptools
  ];

  # only returns information how to really build
  dontConfigure = true;

  env.USE_SYSTEM_BROTLI = 1;

  buildInputs = [
    brotli
  ];

  meta = {
    homepage = "https://github.com/google/brotli";
    description = "Generic-purpose lossless compression algorithm";
    license = lib.licenses.mit;
  };
}
