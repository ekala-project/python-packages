{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,

  # build-system
  meson-python,
  setuptools-scm,
  cython,

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

buildPythonPackage (finalAttrs: {
  pname = "numcodecs";
  version = "0.17.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-UGncAbAIfGE1y7OwQ3B6r5J8mS/NMlJI0V2QfFHdN0c=";
  };

  # meson.build runs this helper via its `#!/usr/bin/env python3` shebang
  postPatch = ''
    patchShebangs src/numcodecs/_build_utils/gitversion.py
  '';

  build-system = [
    meson-python
    setuptools-scm
    cython
    numpy
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
  };
})
