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
  version = "2.8.21";

  outputs = [
    "out"
    "dev"
  ];

  src = fetchurl {
    url = "https://github.com/rrthomas/enchant/releases/download/v${finalAttrs.version}/enchant-${finalAttrs.version}.tar.gz";
    hash = "sha256-3Sp2JpfEYxSKj1mGcIml6/LdFEnYafk3ZLdsErz4rMA=";
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

  # With all spell providers disabled, lib/enchant-2 is never created,
  # but the providers Makefile install-data-hook tries to cd into it.
  preInstall = ''
    mkdir -p $out/lib/enchant-2
  '';

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
    platforms = lib.platforms.unix;
  };
})
