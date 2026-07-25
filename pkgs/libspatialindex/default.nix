{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "libspatialindex";
  version = "2.1.0";

  src = fetchFromGitHub {
    owner = "libspatialindex";
    repo = "libspatialindex";
    rev = finalAttrs.version;
    hash = "sha256-a2CzRLHdQMnVhHZhwYsye4X644r8gp1m6vU2CJpSRpU=";
  };

  patches = [
    ./no-rpath-for-darwin.diff
  ];

  postPatch = ''
    patchShebangs test/
  '';

  nativeBuildInputs = [
    cmake
    cmake.configurePhaseHook
  ];

  cmakeFlags = [
    (lib.cmakeBool "BUILD_TESTING" finalAttrs.finalPackage.doCheck)
    "-DCMAKE_INSTALL_INCLUDEDIR=include"
    "-DCMAKE_INSTALL_LIBDIR=lib"
  ];

  doCheck = true;

  meta = {
    description = "Extensible spatial index library in C++";
    homepage = "https://libspatialindex.org";
    license = lib.licenses.mit;
    platforms = lib.platforms.unix;
    maintainers = [ ];
  };
})
