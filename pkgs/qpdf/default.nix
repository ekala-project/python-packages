{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  libjpeg,
  perl,
  zlib,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "qpdf";
  version = "12.4.1";

  src = fetchFromGitHub {
    owner = "qpdf";
    repo = "qpdf";
    tag = "v${finalAttrs.version}";
    hash = "sha256-OGFSr/fdfOz6nCLbYfNNTgd5vuehADyFUh4o28Q3j3U=";
  };

  outputs = [
    "bin"
    "doc"
    "lib"
    "man"
    "out"
  ];

  nativeBuildInputs = [
    cmake
    cmake.configurePhaseHook
    perl
  ];

  buildInputs = [
    zlib
    libjpeg
  ];

  cmakeFlags = [
    (lib.cmakeBool "SHOW_FAILED_TEST_OUTPUT" true)
  ];

  preConfigure = ''
    patchShebangs qtest/bin/qtest-driver
    patchShebangs run-qtest
    substituteInPlace CMakeLists.txt --replace "run-qtest" "run-qtest --top $src --code $src --bin $out"

    # completion test requires a functional bash completion environment
    # which is not available in the Nix build sandbox
    rm qpdf/qtest/completion.test
  '';

  doCheck = true;

  ${if stdenv.cc.libcxx or null != null then "patches" else null} = [
    ./disable-timestamp-test.patch
  ];

  meta = {
    homepage = "https://qpdf.sourceforge.io/";
    description = "C++ library and set of programs that inspect and manipulate the structure of PDF files";
    license = lib.licenses.asl20;
    mainProgram = "qpdf";
    platforms = lib.platforms.all;
    pkgConfigModules = [ "libqpdf" ];
    maintainers = [ ];
  };
})
