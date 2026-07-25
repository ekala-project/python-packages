{
  lib,
  stdenv,
  fetchFromGitHub,
  boost,
  zlib,
  libevent,
  openssl,
  python3,
  cmake,
  pkg-config,
  bison,
  flex,
  static ? stdenv.hostPlatform.isStatic,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "thrift";
  version = "0.22.0";

  src = fetchFromGitHub {
    owner = "apache";
    repo = "thrift";
    tag = "v${finalAttrs.version}";
    hash = "sha256-gGAO+D0A/hEoHMm6OvRBc1Mks9y52kfd0q/Sg96pdW4=";
  };

  # Workaround to make the Python wrapper not drop this package:
  # pythonFull.buildEnv.override { extraLibs = [ thrift ]; }
  pythonPath = [ ];

  nativeBuildInputs = [
    bison
    cmake
    cmake.configurePhaseHook
    flex
    pkg-config
    (python3.withPackages (
      ps:
      with ps;
      [
        setuptools
        six
      ]
      ++ lib.optionals (!static) [
        twisted
      ]
    ))
  ];

  buildInputs = [
    boost
  ];

  strictDeps = true;

  propagatedBuildInputs = [
    libevent
    openssl
    zlib
  ];

  preConfigure = ''
    export PY_PREFIX=$out
  '';

  cmakeFlags = [
    (lib.cmakeBool "BUILD_JAVASCRIPT" false)
    (lib.cmakeBool "BUILD_NODEJS" false)
    (lib.cmakeBool "BUILD_SHARED_LIBS" (!static))
    (lib.cmakeBool "OPENSSL_USE_STATIC_LIBS" static)
    (lib.cmakeBool "BUILD_TESTING" false)
  ];

  doCheck = false;

  meta = {
    description = "Library for scalable cross-language services";
    mainProgram = "thrift";
    homepage = "https://thrift.apache.org/";
    license = lib.licenses.asl20;
    platforms = lib.platforms.linux ++ lib.platforms.darwin;
    maintainers = [ ];
  };
})
