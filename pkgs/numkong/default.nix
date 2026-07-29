{ lib
, cmake
, fetchFromGitHub
, stdenv
,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "numkong";
  version = "7.7.0";

  outputs = [
    "out"
    "lib"
    "dev"
  ];

  src = fetchFromGitHub {
    owner = "ashvardanian";
    repo = "NumKong";
    tag = "v${finalAttrs.version}";
    hash = "sha256-JZafqqq3jDX+iim2DvyuavuvZ0wrPLIU+hcrOiT1L84=";
  };

  nativeBuildInputs = [ cmake ];

  meta = {
    description = "Portable mixed-precision math, linear-algebra, & retrieval library with 2000+ SIMD kernels";
    homepage = "https://github.com/ashvardanian/NumKong/";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
