{
  lib,
  buildPythonPackage,
  fetchPypi,
  cargo,
  rustPlatform,
  rustc,
  setuptools-rust,
  setuptools-scm,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "cbor2";
  version = "6.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-CGwViL1AekZznacEte59FSJdyZjZWCoFGfxsmhFLJfc=";
  };

  cargoRoot = "rust";
  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs)
      pname
      version
      src
      cargoRoot
      ;
    hash = "sha256-cf8PSCUgJFGDsyJXTARVU4c+Uq+wE9MIgZao83GxHp4=";
  };

  build-system = [
    setuptools
    setuptools-rust
    setuptools-scm
  ];

  nativeBuildInputs = [
    rustPlatform.cargoSetupHook
    cargo
    rustc
  ];

  pythonImportsCheck = [ "cbor2" ];

  meta = {
    description = "Python CBOR (de)serializer with extensive tag support";
    homepage = "https://github.com/agronholm/cbor2";
    license = lib.licenses.mit;
    mainProgram = "cbor2";
  };
})
