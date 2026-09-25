{
  lib,
  abseil-cpp,
  fetchFromGitHub,
  stdenv,
  cmake,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "sentencepiece";
  version = "0.2.2";

  src = fetchFromGitHub {
    owner = "google";
    repo = "sentencepiece";
    tag = "v${finalAttrs.version}";
    sha256 = "sha256-yjTLC5qnREOOpMo0UdDWZpuGdJH6bPhCKyJoetZD3lA=";
  };

  nativeBuildInputs = [
    cmake
    cmake.configurePhaseHook
  ];

  buildInputs = [ abseil-cpp ];

  outputs = [
    "bin"
    "dev"
    "out"
  ];

  # https://github.com/google/sentencepiece/issues/754
  postPatch = ''
    substituteInPlace CMakeLists.txt \
      --replace '\$'{exec_prefix}/'$'{CMAKE_INSTALL_LIBDIR} '$'{CMAKE_INSTALL_FULL_LIBDIR} \
      --replace '\$'{prefix}/'$'{CMAKE_INSTALL_INCLUDEDIR} '$'{CMAKE_INSTALL_FULL_INCLUDEDIR}

    # Make third_party writable so cmake can create the absl symlink
    chmod +w third_party
  '';

  cmakeFlags = [
    "-DSPM_ABSL_PROVIDER=package"
  ]
  ++ lib.optionals stdenv.hostPlatform.isDarwin [
    # On Darwin, non-static build segfaults on python module import.
    # See: https://github.com/NixOS/nixpkgs/issues/466092
    "-DSPM_ENABLE_SHARED=OFF"
  ];

  meta = {
    homepage = "https://github.com/google/sentencepiece";
    description = "Unsupervised text tokenizer for Neural Network-based text generation";
    license = lib.licenses.asl20;
    platforms = lib.platforms.unix;
  };
})
