{
  lib,
  stdenv,
  fetchFromGitHub,
  fetchpatch,
  autoreconfHook,
  autogen,
  pkg-config,
  python3,
  flac,
  lame,
  libmpg123,
  libogg,
  libopus,
  libvorbis,
  alsa-lib,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "libsndfile";
  version = "1.2.2";

  src = fetchFromGitHub {
    owner = "libsndfile";
    repo = "libsndfile";
    rev = finalAttrs.version;
    hash = "sha256-MOOX/O0UaoeMaQPW9PvvE0izVp+6IoE5VbtTx0RvMkI=";
  };

  patches = [
    # Fix build with gcc15
    # https://github.com/libsndfile/libsndfile/pull/1055
    (fetchpatch {
      url = "https://github.com/libsndfile/libsndfile/commit/2251737b3b175925684ec0d37029ff4cb521d302.patch";
      hash = "sha256-LaeptEicnjpVBExlK4dNMlN8+AAJhW8dIvemF6S4W2M=";
    })
  ];

  nativeBuildInputs = [
    autoreconfHook
    autogen
    pkg-config
    python3
  ];
  buildInputs = [
    flac
    lame
    libmpg123
    libogg
    libopus
    libvorbis
  ]
  ++ lib.optionals stdenv.hostPlatform.isLinux [ alsa-lib ];

  enableParallelBuilding = true;

  outputs = [
    "bin"
    "dev"
    "out"
    "man"
    "doc"
  ];

  # need headers from the Carbon.framework in /System/Library/Frameworks to
  # compile this on darwin -- not sure how to handle
  preConfigure = lib.optionalString stdenv.hostPlatform.isDarwin ''
    NIX_CFLAGS_COMPILE+=" -I$SDKROOT/System/Library/Frameworks/Carbon.framework/Versions/A/Headers"
  '';

  # Needed on Darwin.
  env.NIX_CFLAGS_LINK = toString [
    "-logg"
    "-lvorbis"
  ];

  # Broken with libopus >= 1.6.0
  doCheck = false;

  meta = {
    description = "C library for reading and writing files containing sampled sound";
    homepage = "https://libsndfile.github.io/libsndfile/";
    license = lib.licenses.lgpl2Plus;
    maintainers = [ ];
    platforms = lib.platforms.all;
  };
})
