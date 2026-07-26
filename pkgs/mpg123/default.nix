{
  lib,
  stdenv,
  fetchurl,
  makeWrapper,
  pkg-config,
  libOnly ? false,
  withAlsa ? stdenv.hostPlatform.isLinux,
  alsa-lib,
  withPulse ? false,
  withCoreAudio ? stdenv.hostPlatform.isDarwin,
  withJack ? false,
  withConplay ? !libOnly && !stdenv.hostPlatform.isWindows,
  perl,
}:

assert withConplay -> !libOnly;

stdenv.mkDerivation (finalAttrs: {
  pname = "${lib.optionalString libOnly "lib"}mpg123";
  version = "1.33.6";

  src = fetchurl {
    url = "mirror://sourceforge/mpg123/mpg123-${finalAttrs.version}.tar.bz2";
    hash = "sha256-kpp8GLpmK4knrtTeIprZroqytIBt0PMLkBE+sbTiGVo=";
  };

  outputs = [
    "out"
    "dev"
    "man"
  ]
  ++ lib.optional withConplay "conplay";

  nativeBuildInputs = lib.optionals (!libOnly) (
    lib.optionals withConplay [ makeWrapper ] ++ lib.optionals (withPulse || withJack) [ pkg-config ]
  );

  buildInputs = lib.optionals (!libOnly) (
    lib.optionals withConplay [ perl ] ++ lib.optionals withAlsa [ alsa-lib ]
  );

  configureFlags =
    lib.optionals (!libOnly) [
      "--with-audio=${
        lib.strings.concatStringsSep "," (
          lib.optional withAlsa "alsa" ++ lib.optional withCoreAudio "coreaudio" ++ [ "dummy" ]
        )
      }"
    ]
    ++ lib.optional (stdenv.hostPlatform ? mpg123) "--with-cpu=${stdenv.hostPlatform.mpg123.cpu}";

  enableParallelBuilding = true;

  postInstall = lib.optionalString withConplay ''
    mkdir -p $conplay/bin
    mv scripts/conplay $conplay/bin/
  '';

  preFixup = lib.optionalString withConplay ''
    patchShebangs $conplay/bin/conplay
  '';

  postFixup = lib.optionalString withConplay ''
    wrapProgram $conplay/bin/conplay \
      --prefix PATH : $out/bin
  '';

  meta = {
    description = "Fast console MPEG Audio Player and decoder library";
    homepage = "https://mpg123.org";
    license = lib.licenses.lgpl21Only;
    maintainers = [ ];
    platforms = lib.platforms.all;
  };
})
