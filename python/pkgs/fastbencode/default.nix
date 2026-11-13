{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-rust,
  rustPlatform,
  cargo,
  rustc,
}:

buildPythonPackage (finalAttrs: {
  pname = "fastbencode";
  version = "0.3.12";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-oNQD8xIqriTTTSaCZl5QWSW7p6bTJG2kgreiqc3OqP4=";
  };

  cargoDeps = rustPlatform.importCargoLock { lockFile = ./Cargo.lock; };

  postPatch = ''
    ln -s ${./Cargo.lock} Cargo.lock
  '';

  nativeBuildInputs = [
    rustPlatform.cargoSetupHook
    cargo
    rustc
  ];

  build-system = [
    setuptools
    setuptools-rust
  ];

  pythonImportsCheck = [ "fastbencode" ];

  meta = {
    description = "Fast implementation of bencode";
    homepage = "https://github.com/breezy-team/fastbencode";
    license = lib.licenses.gpl2Plus;
  };
})
