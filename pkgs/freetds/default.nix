{
  lib,
  stdenv,
  fetchurl,
  autoreconfHook,
  pkg-config,
  openssl,
  odbcSupport ? true,
  unixodbc ? null,
}:

assert odbcSupport -> unixodbc != null;

stdenv.mkDerivation (finalAttrs: {
  pname = "freetds";
  version = "1.5.18";

  src = fetchurl {
    url = "https://www.freetds.org/files/stable/freetds-${finalAttrs.version}.tar.bz2";
    hash = "sha256-ayyLk7nufIOFXa90XeWHh5ADLxTbruVT2DqdIRuE3Us=";
  };

  patches = [
    ./gettext-0.25.patch
  ];

  buildInputs = [
    openssl
  ]
  ++ lib.optional odbcSupport unixodbc;

  nativeBuildInputs = [
    autoreconfHook
    pkg-config
  ];

  meta = {
    description = "Libraries to natively talk to Microsoft SQL Server and Sybase databases";
    homepage = "https://www.freetds.org";
    license = lib.licenses.lgpl2;
    maintainers = [ ];
    platforms = lib.platforms.all;
  };
})
