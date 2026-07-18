{
  lib,
  stdenv,
  buildPythonPackage,
  pythonOlder,
  fetchFromGitHub,

  # build-system
  setuptools,
  pkg-config,
  pybind11,

  # native dependencies
  freetype,
  libjpeg,
  libxcb,
  zlib-ng,

  # optional dependencies
  defusedxml ? null,
  olefile ? null,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "pillow";
  version = "12.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-pillow";
    repo = "pillow";
    tag = version;
    hash = "sha256-58mjwHErEZPkkGBVZznkkMQN5Zo4ZBBiXnhqVp1F81g=";
  };

  build-system = [
    setuptools
    pybind11
  ];

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [
    freetype
    libjpeg
    libxcb
    zlib-ng
  ];

  pypaBuildFlags = [
    "--config-setting=--disable-platform-guessing"
  ];

  preConfigure = ''
    export LDFLAGS="$LDFLAGS -L${libxcb}/lib"
    export CFLAGS="$CFLAGS -I${libxcb.dev}/include"
  '';

  optional-dependencies = {
    fpx = lib.optional (olefile != null) olefile;
    mic = lib.optional (olefile != null) olefile;
    typing = lib.optionals (pythonOlder "3.10") [ typing-extensions ];
    xmp = lib.optional (defusedxml != null) defusedxml;
  };

  pythonImportsCheck = [ "PIL" ];

  meta = {
    homepage = "https://python-pillow.github.io/";
    description = "Friendly PIL fork (Python Imaging Library)";
    license = lib.licenses.mit-cmu;
  };
}
