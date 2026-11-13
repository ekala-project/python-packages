{
  stdenv,
  lib,
  buildPythonPackage,
  cargo,
  fetchPypi,
  rustc,
  rustPlatform,
  libiconv,
}:

buildPythonPackage (finalAttrs: {
  pname = "rpds-py";
  version = "2026.9.1";
  pyproject = true;

  src = fetchPypi {
    pname = "rpds_py";
    inherit (finalAttrs) version;
    hash = "sha256-R5Pvf3gmixJLc/qTNEDwHSWLuuAd6fpT6QgMmrBCWhI=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) pname version src;
    hash = "sha256-ffIVY9j7qLqvZ9V4xCQTtvjtlKUKegiyt8HbYorVE3s=";
  };

  nativeBuildInputs = [
    rustPlatform.cargoSetupHook
    rustPlatform.maturinBuildHook
    cargo
    rustc
  ];

  buildInputs = lib.optionals stdenv.hostPlatform.isDarwin [ libiconv ];

  pythonImportsCheck = [ "rpds" ];

  meta = {
    description = "Python bindings to Rust's persistent data structures";
    homepage = "https://github.com/crate-py/rpds";
    license = lib.licenses.mit;
  };
})
