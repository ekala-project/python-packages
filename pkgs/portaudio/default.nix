{
  lib,
  stdenv,
  fetchurl,
  alsa-lib,
  pkg-config,
  which,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "portaudio";
  version = "190700_20210406";

  src = fetchurl {
    url = "https://files.portaudio.com/archives/pa_stable_v${finalAttrs.version}.tgz";
    sha256 = "1vrdrd42jsnffh6rq8ap2c6fr4g9fcld89z649fs06bwqx1bzvs7";
  };

  strictDeps = true;
  nativeBuildInputs = [
    pkg-config
    which
  ];
  buildInputs = lib.optionals stdenv.hostPlatform.isLinux [ alsa-lib ];

  configureFlags = [
    "--disable-mac-universal"
    "--enable-cxx"
  ];

  env.NIX_CFLAGS_COMPILE = lib.optionalString stdenv.cc.isClang "-Wno-error=nullability-inferred-on-nested-type -Wno-error=nullability-completeness-on-arrays -Wno-error=implicit-const-int-float-conversion";

  enableParallelBuilding = false;

  postPatch = ''
    export AR=$(which $AR)
  '';

  installPhase = ''
    make install
  ''
  + lib.optionalString stdenv.hostPlatform.isLinux ''
    sed -i "s|-lasound|-L${alsa-lib.out}/lib -lasound|" "$out/lib/pkgconfig/"*.pc
  ''
  + lib.optionalString stdenv.hostPlatform.isDarwin ''
    cp include/pa_mac_core.h $out/include/pa_mac_core.h
  '';

  meta = {
    description = "Portable cross-platform Audio API";
    homepage = "https://www.portaudio.com/";
    license = lib.licenses.mit;
    platforms = lib.platforms.unix;
    maintainers = [ ];
  };

  passthru = {
    api_version = 19;
  };
})
