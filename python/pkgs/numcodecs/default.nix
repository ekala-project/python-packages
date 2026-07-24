{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  setuptools-scm,
  cython,
  py-cpuinfo,

  # dependencies
  numpy,
  typing-extensions,

  # optional-dependencies
  crc32c,
  google-crc32c,
  pcodec,

  # tests
  msgpack,
  python,
}:

buildPythonPackage rec {
  pname = "numcodecs";
  version = "0.16.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-DQ+2CFL4TAvZVDzE0que79N/yO/MQQrNR3fmKh0wAxg=";
  };

  build-system = [
    setuptools
    setuptools-scm
    cython
    py-cpuinfo
  ];

  dependencies = [
    numpy
    typing-extensions
  ];

  optional-dependencies = {
    crc32c = [ crc32c ];
    google_crc32c = [ google-crc32c ];
    msgpack = [ msgpack ];
    pcodec = [ pcodec ];
    # zfpy = [ zfpy ];
  };

  preBuild = lib.optionalString (stdenv.hostPlatform.isx86 && !stdenv.hostPlatform.avx2Support) ''
    export DISABLE_NUMCODECS_AVX2=1
  '';
  # https://github.com/NixOS/nixpkgs/issues/255262
  postCheck = "popd";

  meta = {
    homepage = "https://github.com/zarr-developers/numcodecs";
    license = lib.licenses.mit;
    description = "Buffer compression and transformation codecs for use in data storage and communication applications";
    maintainers = [ ];
  };
}
