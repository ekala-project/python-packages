{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  rustPlatform,
}:

buildPythonPackage rec {
  pname = "jellyfish";
  version = "1.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jamesturk";
    repo = "jellyfish";
    rev = "v${version}";
    hash = "sha256-jKz7FYzV66TUkJZfWDTy8GXmTZ6SU5jEdtkjYLDfS/8=";
  };

  cargoDeps = rustPlatform.importCargoLock {
    lockFile = ./Cargo.lock;
  };

  postPatch = ''
    ln -s ${./Cargo.lock} Cargo.lock
  '';

  build-system = with rustPlatform; [
    cargoSetupHook
    maturinBuildHook
  ];

  pythonImportsCheck = [ "jellyfish" ];

  doCheck = false;

  meta = {
    description = "Python library for doing approximate and phonetic matching of strings";
    homepage = "https://github.com/jamesturk/jellyfish";
    license = lib.licenses.mit;
  };
}
