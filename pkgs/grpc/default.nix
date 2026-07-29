{
  lib,
  stdenv,
  fetchFromGitHub,
  fetchpatch,
  buildPackages,
  cmake,
  zlib,
  c-ares,
  pkg-config,
  re2,
  openssl,
  protobuf,
  grpc,
  abseil-cpp,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "grpc";
  version = "1.82.1";

  src = fetchFromGitHub {
    owner = "grpc";
    repo = "grpc";
    tag = "v${finalAttrs.version}";
    hash = "sha256-w4tl1y1GITlfeHTsSAZm45d8HQVzqSBVEQXoEqO0h5g=";
    fetchSubmodules = true;
  };

  patches = [
    (fetchpatch {
      # armv6l support, https://github.com/grpc/grpc/pull/21341
      name = "grpc-link-libatomic.patch";
      url = "https://github.com/lopsided98/grpc/commit/a9b917666234f5665c347123d699055d8c2537b2.patch";
      hash = "sha256-Lm0GQsz/UjBbXXEE14lT0dcRzVmCKycrlrdBJj+KLu8=";
    })
  ];

  nativeBuildInputs = [
    cmake
    cmake.configurePhaseHook
    pkg-config
  ]
  ++ lib.optional (stdenv.hostPlatform != stdenv.buildPlatform) grpc;

  propagatedBuildInputs = [
    c-ares
    re2
    zlib
    abseil-cpp
  ];

  buildInputs = [
    openssl
    protobuf
  ];

  cmakeFlags = [
    "-DgRPC_ZLIB_PROVIDER=package"
    "-DgRPC_CARES_PROVIDER=package"
    "-DgRPC_RE2_PROVIDER=package"
    "-DgRPC_SSL_PROVIDER=package"
    "-DgRPC_PROTOBUF_PROVIDER=package"
    "-DgRPC_ABSL_PROVIDER=package"
    "-DBUILD_SHARED_LIBS=ON"
  ]
  ++ lib.optionals (stdenv.hostPlatform != stdenv.buildPlatform) [
    "-D_gRPC_PROTOBUF_PROTOC_EXECUTABLE=${buildPackages.protobuf}/bin/protoc"
    "-D_gRPC_CPP_PLUGIN=${buildPackages.grpc}/bin/grpc_cpp_plugin"
  ]
  ++ (
    let
      defaultCxxIsOlderThan17 =
        (stdenv.cc.isClang && lib.versionAtLeast stdenv.cc.cc.version "16.0")
        || (stdenv.cc.isGNU && lib.versionAtLeast stdenv.cc.cc.version "11.0");
    in
    lib.optionals (stdenv.hostPlatform.isDarwin && defaultCxxIsOlderThan17) [
      "-DCMAKE_CXX_STANDARD=17"
    ]
  );

  # CMake creates a build directory by default, this conflicts with the
  # bazel BUILD file on case-insensitive filesystems.
  preConfigure = ''
    rm -vf BUILD
  '';

  preBuild = lib.optionalString (stdenv.hostPlatform == stdenv.buildPlatform) ''
    export LD_LIBRARY_PATH=$(pwd)''${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH
  '';

  env.NIX_CFLAGS_COMPILE = toString [
    "-Wno-error"
  ];

  enableParallelBuilding = true;

  meta = {
    description = "C based gRPC (C++, Python, Ruby, Objective-C, PHP, C#)";
    license = lib.licenses.asl20;
    maintainers = [ ];
    homepage = "https://grpc.io/";
    platforms = lib.platforms.all;
  };
})
