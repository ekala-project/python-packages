{
  buildPythonPackage,
  cacert,
  fetchPypi,
  hypothesis,
  lib,
  nix-update-script,
  rustPlatform,
}:

buildPythonPackage (finalAttrs: {
  pname = "jsonschema-rs";
  version = "0.61.1";

  pyproject = true;

  # Fetching from Pypi, because there is no Cargo.lock in the GitHub repo.
  src = fetchPypi {
    inherit (finalAttrs) version;
    pname = "jsonschema_rs";
    hash = "sha256-uyuo/24oIgWoF3Xc6WmFawXjRF91aPnzNeMEIPNR1uU=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) pname version src;
    hash = "sha256-NTJPXebnVIARlK7LDV2uV51jMja1q++cSrsHAaq7vAM=";
  };

  nativeBuildInputs = with rustPlatform; [
    cargoSetupHook
    maturinBuildHook
  ];
  # Need the official JSON Schema Test Suite, which is fetched as a git
  # submodule and not bundled in the sdist.
  pythonImportsCheck = [ "jsonschema_rs" ];
  passthru.updateScript = nix-update-script { };

  meta = {
    description = "High-performance JSON Schema validator for Python";
    homepage = "https://github.com/Stranger6667/jsonschema/tree/master/crates/jsonschema-py";
    license = lib.licenses.mit;
  };
})
