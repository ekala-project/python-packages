{
  lib,
  cmake,
  fetchFromGitHub,
  stdenv,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "numkong";
  version = "7.8.2";

  outputs = [
    "out"
    "lib"
    "dev"
  ];

  src = fetchFromGitHub {
    owner = "ashvardanian";
    repo = "NumKong";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Wn1qpPKdbWUJ5Gy4hnX9XcEneFvgrijGuI+v1F9+9EE=";
  };

  nativeBuildInputs = [
    cmake
    cmake.configurePhaseHook
  ];

  meta = {
    description = "Portable mixed-precision math, linear-algebra, & retrieval library with 2000+ SIMD kernels";
    homepage = "https://github.com/ashvardanian/NumKong/";
    license = lib.licenses.asl20;
  };
})
