{
  buildPythonPackage,
  cacert,
  fetchPypi,
  hypothesis,
  lib,
  nix-update-script,
  rustPlatform,
}:

buildPythonPackage rec {
  pname = "jsonschema-rs";
  version = "0.46.5";

  pyproject = true;

  # Fetching from Pypi, because there is no Cargo.lock in the GitHub repo.
  src = fetchPypi {
    inherit version;
    pname = "jsonschema_rs";
    hash = "sha256-hX434HWi2fbyPepYpVmlW2Y9OHmiUhcABLVpBz2rHvM=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit pname version src;
    hash = "sha256-HnrbyfuKIaYKs3ux8Du/PabPNpNu1v37Qm/5gJM6arw=";
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
    maintainers = [ ];
  };
}
