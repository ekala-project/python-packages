{
  lib,
  stdenv,
  fetchurl,
  cairo,
  clang-tools,
  cmake,
  boost,
  curl,
  fontconfig,
  freetype,
  glib,
  lcms2,
  libiconv,
  libjpeg,
  libtiff,
  ninja,
  openjpeg,
  pkg-config,
  python3,
  zlib,
  poppler_data,
  nss,
}:

let
  mkFlag = optset: flag: "-DENABLE_${flag}=${if optset then "on" else "off"}";
in
stdenv.mkDerivation (finalAttrs: {
  pname = "poppler-utils";
  version = "26.06.0";

  outputs = [
    "out"
    "dev"
  ];

  src = fetchurl {
    url = "https://poppler.freedesktop.org/poppler-${finalAttrs.version}.tar.xz";
    hash = "sha256-TLTlo9yMte7HUciiPIuhn2H5be3AzQfSruawyOLPa6Q=";
  };

  nativeBuildInputs = [
    cmake
    cmake.configurePhaseHook
    ninja
    pkg-config
    python3
    glib # for glib-mkenums
  ]
  ++ lib.optionals stdenv.cc.isClang [
    clang-tools
  ];

  buildInputs = [
    boost
    libiconv
    poppler_data
  ];

  # TODO: reduce propagation to necessary libs
  propagatedBuildInputs = [
    zlib
    freetype
    fontconfig
    libjpeg
    openjpeg
    cairo
    lcms2
    libtiff
    curl
    nss
  ];

  cmakeFlags = [
    (mkFlag true "UNSTABLE_API_ABI_HEADERS")
    (mkFlag true "GLIB")
    (mkFlag true "CPP")
    (mkFlag true "LIBCURL")
    (mkFlag true "LCMS")
    (mkFlag true "LIBTIFF")
    (mkFlag true "NSS3")
    (mkFlag true "UTILS")
    (mkFlag false "QT5")
    (mkFlag false "QT6")
    (mkFlag false "GPGME")
  ];

  dontWrapQtApps = true;

  doCheck = false;

  meta = {
    homepage = "https://poppler.freedesktop.org/";
    description = "PDF rendering library";
    longDescription = ''
      Poppler is a PDF rendering library based on the xpdf-3.0 code base. In
      addition it provides a number of tools that can be installed separately.
    '';
    license = lib.licenses.gpl2Plus;
    platforms = lib.platforms.all;
    maintainers = [ ];
    pkgConfigModules = [
      "poppler"
      "poppler-cpp"
      "poppler-glib"
    ];
  };
})
