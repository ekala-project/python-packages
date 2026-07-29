{
  # utils
  stdenv,
  fetchFromGitHub,
  lib,

  # runtime dependencies
  openssl,
  tzdata,
  zlib,

  # build dependencies
  bison,
  flex,
  makeWrapper,
  perl,
  pkg-config,

  # Curl
  curlSupport ? lib.meta.availableOn stdenv.hostPlatform curl && !stdenv.hostPlatform.isStatic,
  curl,

  # GSSAPI
  gssSupport ? with stdenv.hostPlatform; !isWindows && !isStatic,
  libkrb5,

  # NLS
  nlsSupport ? false,
  gettext,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "libpq";
  version = "18.4";

  src = fetchFromGitHub {
    owner = "postgres";
    repo = "postgres";
    # rev, not tag, on purpose: see generic.nix.
    rev = "refs/tags/REL_18_4";
    hash = "sha256-Ac/Dqcj8vjcW3my5vsnKaMiQqTq/HPtUzckJ3SMyrfA=";
  };

  __structuredAttrs = true;

  outputs = [
    "out"
    "dev"
  ];
  outputChecks.out = {
    disallowedReferences = [ "dev" ];
    disallowedRequisites = [
      stdenv.cc
    ]
    ++ (map lib.getDev (builtins.filter (drv: drv ? "dev") finalAttrs.buildInputs));
  };

  buildInputs = [
    zlib
    openssl
  ]
  ++ lib.optionals curlSupport [ curl ]
  ++ lib.optionals gssSupport [ libkrb5 ]
  ++ lib.optionals nlsSupport [ gettext ];

  nativeBuildInputs = [
    bison
    flex
    makeWrapper
    perl
    pkg-config
  ];

  # causes random build failures
  enableParallelBuilding = false;

  separateDebugInfo = true;

  buildFlags = [
    "submake-libpgport"
    "submake-libpq"
  ];

  # libpgcommon.a and libpgport.a contain all paths normally returned by pg_config and are
  # linked into all shared libraries. However, almost no binaries actually use those paths.
  # The following flags will remove unused sections from all shared libraries - including
  # those paths. This avoids a lot of circular dependency problems with different outputs,
  # and allows splitting them cleanly.
  env.CFLAGS =
    "-fdata-sections -ffunction-sections"
    + (if stdenv.cc.isClang then " -flto" else " -fmerge-constants -Wl,--gc-sections");

  env.NIX_CFLAGS_COMPILE = "-UUSE_PRIVATE_ENCODING_FUNCS";

  configureFlags = [
    "--enable-debug"
    "--sysconfdir=/etc"
    "--with-openssl"
    "--with-system-tzdata=${tzdata}/share/zoneinfo"
    "--without-icu"
    "--without-perl"
    "--without-readline"
  ]
  ++ lib.optionals curlSupport [ "--with-libcurl" ]
  ++ lib.optionals gssSupport [ "--with-gssapi" ]
  ++ lib.optionals nlsSupport [ "--enable-nls" ];

  patches = lib.optionals stdenv.hostPlatform.isLinux [
    ./patches/socketdir-in-run-13+.patch
  ];

  postPatch = ''
    cat ${./pg_config.env.mk} >> src/common/Makefile
  ''
  + lib.optionalString stdenv.hostPlatform.isStatic ''
    substituteInPlace src/interfaces/libpq/Makefile \
      --replace-fail "all: all-lib libpq-refs-stamp" "all: all-lib"
    substituteInPlace src/Makefile.shlib \
      --replace-fail "all-lib: all-shared-lib" "all-lib: all-static-lib" \
      --replace-fail "install-lib: install-lib-shared" "install-lib: install-lib-static"
  '';

  installPhase = ''
    runHook preInstall

    make -C src/common install pg_config.env
    make -C src/include install
    make -C src/interfaces/libpq install
  ''
  + lib.optionalString curlSupport ''
    make -C src/interfaces/libpq-oauth install
  ''
  + ''
    make -C src/port install

    substituteInPlace src/common/pg_config.env \
      --replace-fail "$out" "@out@"

    install -D src/common/pg_config.env "$dev/nix-support/pg_config.env"
    moveToOutput "lib/*.a" "$dev"

    rm -rfv $out/share
    rm -rfv $dev/lib/*_shlib.a

    runHook postInstall
  '';

  postInstall =
    if stdenv.hostPlatform.isStatic then
      "touch $out/empty"
    else
      lib.optionalString (!(finalAttrs.dontDisableStatic or false)) "rm -rfv $dev/lib/*.a";

  doCheck = false;

  meta = {
    description = "C application programmer's interface to PostgreSQL";
    homepage = "https://www.postgresql.org";
    license = lib.licenses.postgresql;
    pkgConfigModules = [ "libpq" ];
    maintainers = [ ];
    platforms = lib.platforms.all;
  };
})
