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

buildPythonPackage rec {
  pname = "fastbencode";
  version = "0.3.11";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-fivkW/6BFnzXmYZpiizycOr2Gt1bG8cRN4wrs/BTltU=";
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
}
