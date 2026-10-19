{
  lib,
  buildPythonPackage,
  fetchPypi,
  rustPlatform,
}:

buildPythonPackage (finalAttrs: {
  pname = "loro";
  version = "1.13.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-DDcnvFL1CYV2Uy7dOZ78CM6yNMXZI1oZy9XqN8T7pIU=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) pname version src;
    hash = "sha256-KVBe2bUvxilOysCVfcBSZCtwexlTkVAc83tH1H7nMbQ=";
  };

  build-system = [
    rustPlatform.maturinBuildHook
    rustPlatform.cargoSetupHook
  ];
  meta = {
    description = "Data collaborative and version-controlled JSON with CRDTs";
    homepage = "https://github.com/loro-dev/loro-py";
    license = lib.licenses.mit;
  };
})
