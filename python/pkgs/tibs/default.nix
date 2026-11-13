{
  lib,
  buildPythonPackage,
  fetchPypi,
  rustPlatform,
}:

buildPythonPackage (finalAttrs: {
  pname = "tibs";
  version = "2.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-Y6e4fiYsVYzMFr5n00/mBiDjm0m/ZErGXnHEVTFzrI8=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) pname version src;
    hash = "sha256-/3WpmJ8DZm9t1cUO7pb2D4nsLgpNDleB3aaSxvvtyQI=";
  };

  nativeBuildInputs = with rustPlatform; [
    maturinBuildHook
    cargoSetupHook
  ];

  pythonImportsCheck = [ "tibs" ];

  meta = {
    description = "Sleek Python library for binary data";
    homepage = "https://github.com/scott-griffiths/tibs";
    license = lib.licenses.mit;
  };
})
