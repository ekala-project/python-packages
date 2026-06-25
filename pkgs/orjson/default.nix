{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  rustPlatform,
  cffi,

  # native dependencies
  libiconv,
}:

buildPythonPackage rec {
  pname = "orjson";
  version = "3.11.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ijl";
    repo = "orjson";
    tag = version;
    hash = "sha256-4a8vNQEe1P1t2BcqSL+d+GLHi1lhUtbA7p5/vj/J0Lc=";
  };

  patches = lib.optionals (stdenv.buildPlatform != stdenv.hostPlatform) [
    # fix architecture checks in build.rs to fix build for riscv
    ./cross-arch-compat.patch
  ];

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit pname version src;
    hash = "sha256-eB7jVTsvBSUjtaKsbRnRtYSd+SqnCaoDyG76iExmSHc=";
  };

  nativeBuildInputs = [
    cffi
  ]
  ++ (with rustPlatform; [
    cargoSetupHook
    maturinBuildHook
  ]);

  buildInputs = lib.optionals stdenv.hostPlatform.isDarwin [ libiconv ];

  pythonImportsCheck = [ "orjson" ];

  meta = {
    description = "Fast, correct Python JSON library supporting dataclasses, datetimes, and numpy";
    homepage = "https://github.com/ijl/orjson";
    license = with lib.licenses; [
      asl20
      mit
    ];
    platforms = lib.platforms.unix;
  };
}
