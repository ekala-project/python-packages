{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  rustPlatform,
  pkgs,

  # dependencies
  pyarrow,
  typing-extensions,
}:

let
  protobuf-c = pkgs.protobuf;
in
buildPythonPackage (finalAttrs: {
  pname = "datafusion";
  version = "53.0.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    name = "datafusion-source";
    owner = "apache";
    repo = "datafusion-python";
    tag = finalAttrs.version;
    fetchSubmodules = true;
    hash = "sha256-3plgAJuh2rrnvzkQVy3gUgEoHHT4FSjDp5DZx1keD+g=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) pname src version;
    hash = "sha256-kHGlUaPNSs1Nh3HCU+yUVQq/IXp9PUwpDmfAon8eRBk=";
  };

  nativeBuildInputs = with rustPlatform; [
    cargoSetupHook
    maturinBuildHook
    protobuf-c
  ];

  buildInputs = [
    protobuf-c
  ];

  dependencies = [
    pyarrow
    typing-extensions
  ];

  pythonImportsCheck = [
    "datafusion"
    "datafusion._internal"
  ];

  meta = {
    description = "Extensible query execution framework";
    homepage = "https://arrow.apache.org/datafusion/";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
