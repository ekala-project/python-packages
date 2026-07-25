{
  stdenv,
  lib,
  fetchurl,
  fetchFromGitHub,
  buildPackages,
  pkg-config,
  fixDarwinDylibNames,
  freetype,
  harfbuzz,
  openjpeg,
  jbig2dec,
  libjpeg,
  gumbo,
  enableX11 ? false,
  enableCurl ? true,
  curl,
  openssl,
  enableGL ? false,
  enableOcr ? false,
  enableCxx ? false,
  enablePython ? false,
  enableBarcode ? false,
}:

stdenv.mkDerivation rec {
  version = "1.27.2";
  pname = "mupdf";

  src = fetchurl {
    url = "https://mupdf.com/downloads/archive/${pname}-${version}-source.tar.gz";
    hash = "sha256-VThnsTUwPcTCWrZ8XyNNjpAKDjbmboSE2ZrcBf4ehzc=";
  };

  patches = [
    # Upstream makefile does not work with system deps on macOS by default, so
    # we reuse the Linux section instead.
    ./fix-darwin-system-deps.patch
    # Upstream C++ wrap script only defines fixed-sized integers on macOS but
    # this is required on aarch64-linux too.
    ./fix-cpp-build.patch
  ];

  postPatch = ''
    substituteInPlace Makerules --replace-fail "(shell pkg-config" "(shell $PKG_CONFIG"
  '';

  makeFlags = [
    "prefix=$(out)"
    "shared=yes"
    "USE_SYSTEM_LIBS=yes"
    "PKG_CONFIG=${buildPackages.pkg-config}/bin/${buildPackages.pkg-config.targetPrefix}pkg-config"
    "HAVE_X11=no"
    "HAVE_GLUT=no"
  ];

  nativeBuildInputs = [
    pkg-config
  ]
  ++ lib.optionals stdenv.hostPlatform.isDarwin [
    fixDarwinDylibNames
  ];

  buildInputs = [
    freetype
    harfbuzz
    openjpeg
    jbig2dec
    libjpeg
    gumbo
  ]
  ++ lib.optionals enableCurl [
    curl
    openssl
  ];

  outputs = [
    "bin"
    "dev"
    "out"
    "man"
    "doc"
  ];

  preConfigure = ''
    # Don't remove mujs or zxing-cpp because upstream version is incompatible
    rm -rf thirdparty/{curl,freetype,glfw,harfbuzz,jbig2dec,libjpeg,openjpeg,zlib}
  '';

  postInstall = ''
    mkdir -p "$out/lib/pkgconfig"
    cat >"$out/lib/pkgconfig/mupdf.pc" <<EOF
    prefix=$out
    libdir=''${prefix}/lib
    includedir=''${prefix}/include

    Name: mupdf
    Description: Library for rendering PDF documents
    Version: ${version}
    Libs: -L''${libdir} -lmupdf
    Cflags: -I''${includedir}
    EOF

    moveToOutput "bin" "$bin"
  ''
  + (lib.optionalString stdenv.hostPlatform.isDarwin ''
    for exe in $bin/bin/*; do
      install_name_tool -change build/shared-release/libmupdf.dylib $out/lib/libmupdf.dylib "$exe"
    done
  '');

  enableParallelBuilding = true;

  env.USE_SONAME = lib.boolToYesNo (!stdenv.hostPlatform.isDarwin);

  meta = {
    homepage = "https://mupdf.com";
    description = "Lightweight PDF, XPS, and E-book viewer and toolkit written in portable C";
    license = lib.licenses.agpl3Plus;
    maintainers = [ ];
    platforms = lib.platforms.unix;
    mainProgram = "mupdf";
  };
}
