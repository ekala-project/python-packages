{
  stdenv,
  lib,
  fetchurl,
  groff,
  pkg-config,
  glib,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "enchant";
  version = "2.6.9";

  outputs = [
    "out"
    "dev"
  ];

  src = fetchurl {
    url = "https://github.com/rrthomas/enchant/releases/download/v${finalAttrs.version}/enchant-${finalAttrs.version}.tar.gz";
    hash = "sha256-2aWhDcmzikOzoPoix27W67fgnrU1r/YpVK/NvUDv/2s=";
  };

  strictDeps = true;

  nativeBuildInputs = [
    groff
    pkg-config
  ];

  buildInputs = [
    glib
  ];

  enableParallelBuilding = true;

  configureFlags = [
    "--enable-relocatable"
    "--without-aspell"
    "--without-hspell"
    "--without-hunspell"
    "--without-nuspell"
    "--without-voikko"
    "--without-applespell"
  ];

  meta = {
    description = "Generic spell checking library";
    homepage = "https://rrthomas.github.io/enchant/";
    license = lib.licenses.lgpl21Plus;
    maintainers = [ ];
    platforms = lib.platforms.unix;
  };
})
