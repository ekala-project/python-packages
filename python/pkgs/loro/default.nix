{
  lib,
  buildPythonPackage,
  fetchPypi,
  rustPlatform,
}:

buildPythonPackage (finalAttrs: {
  pname = "loro";
  version = "1.17.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-aXFyehLvLYwjLjrVTZ0Ao/vQR3TROwrg50TQpgtlGEM=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) pname version src;
    hash = "sha256-/sApOFiC+n3yKhVW8v8FhT1k5BcS0xhiBaCHMfUyKgc=";
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
