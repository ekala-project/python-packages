{
  buildPythonPackage,
  fetchFromGitHub,
  hypothesis,
  lib,
  rustPlatform,
}:

buildPythonPackage rec {
  pname = "fastuuid";
  version = "0.14.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fastuuid";
    repo = "fastuuid";
    tag = version;
    hash = "sha256-EXyd94NR4P+FLPxDCa3LmwfpIHwGduoaPL0qULqcj00=";
  };

  cargoDeps = rustPlatform.importCargoLock {
    lockFile = ./Cargo.lock;
  };

  postPatch = ''
    ln -s ${./Cargo.lock} Cargo.lock
  '';

  nativeBuildInputs = [
    rustPlatform.cargoSetupHook
    rustPlatform.maturinBuildHook
  ];

  pythonImportsCheck = [ "fastuuid" ];
  meta = {
    description = "CPython bindings to Rust's UUID library";
    homepage = "https://github.com/fastuuid/fastuuid";
    license = lib.licenses.bsd3;
    maintainers = [ lib.maintainers.dotlambda ];
  };
}
