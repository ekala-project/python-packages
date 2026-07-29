{
  lib,
  newScope,
  fetchFromGitHub,
  unzip,
  stdenvNoCC,
}:
let
  base = {
    version = "0-unstable-2026-07-01";
    nativeBuildInputs = [ unzip ];
    dontBuild = true;
    dontFixup = true;
    meta = {
      description = "NLTK Data";
      homepage = "https://github.com/nltk/nltk_data";
      license = lib.licenses.asl20;
      platforms = lib.platforms.all;
      maintainers = [ ];
    };
  };
  makeNltkDataPackage =
    {
      pname,
      location,
      hash,
    }:
    let
      src = fetchFromGitHub {
        name = "nltk-${location}";
        owner = "nltk";
        repo = "nltk_data";
        rev = "550b6625bcef1f2abff2ff770a5a0d272c9c6b2a";
        inherit hash;
        sparseCheckout = [ "packages/${location}/${pname}.zip" ];
      };
    in
    stdenvNoCC.mkDerivation (
      base
      // {
        inherit pname src;
        inherit (base) version;
        installPhase = ''
          runHook preInstall

          mkdir -p $out
          unzip ${src}/packages/${location}/${pname}.zip
          mkdir -p $out/${location}
          cp -R ${pname}/ $out/${location}

          runHook postInstall
        '';
      }
    );

  makeCorpus =
    pname:
    makeNltkDataPackage {
      inherit pname;
      location = "corpora";
      hash = "sha256-7uiTXZ+eMyBtH135NsYoAjLV6R/DG2hVV+RJwYDmu50=";
    };

  makeTokenizer =
    pname:
    makeNltkDataPackage {
      inherit pname;
      location = "tokenizers";
      hash = "sha256-V/Qs8wJbCZB8gp5pAAM1JK8aAfcHorNyvAkHUat56uY=";
    };
in
lib.makeScope newScope (self: {
  stopwords = makeCorpus "stopwords";
  punkt = makeTokenizer "punkt";
  punkt-tab = makeTokenizer "punkt_tab";
})
