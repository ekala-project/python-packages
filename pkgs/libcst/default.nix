{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  cargo,
  isPy313,
  libiconv,
  pyyaml,
  pyyaml-ft,
  rustPlatform,
  rustc,
  setuptools-rust,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "libcst";
  version = "1.8.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Instagram";
    repo = "LibCST";
    tag = "v${version}";
    hash = "sha256-AJm3grS+I/NXZ8ame4rmHPOxRHGO0Ofo35RtSDO2tyI=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit
      pname
      version
      src
      cargoRoot
      ;
    hash = "sha256-7/Yf2yn7wjW0CDG1Ha3SsvOIytbU1bJCpR9WFAFiPEA=";
  };

  cargoRoot = "native";

  build-system = [
    setuptools-rust
    setuptools-scm
  ];

  nativeBuildInputs = [
    rustPlatform.cargoSetupHook
    cargo
    rustc
  ];

  buildInputs = lib.optionals stdenv.hostPlatform.isDarwin [ libiconv ];

  dependencies = [
    (if isPy313 then pyyaml-ft else pyyaml)
  ];

  pythonImportsCheck = [ "libcst" ];

  meta = {
    description = "Concrete Syntax Tree (CST) parser and serializer library for Python";
    homepage = "https://github.com/Instagram/LibCST";
    license = with lib.licenses; [
      mit
      asl20
      psfl
    ];
  };
}
