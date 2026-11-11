{
  buildPythonPackage,
  lib,
  fetchFromGitHub,
  perl,
  cryptography,
  rustPlatform,
  pretend,
}:

buildPythonPackage (finalAttrs: {
  pname = "rfc3161-client";
  version = "1.0.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "trailofbits";
    repo = "rfc3161-client";
    tag = "v${finalAttrs.version}";
    hash = "sha256-M3O2cOBT7ObhCxAyNyOktLF/ZQvrGkyfk2nmlric4oo=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) src pname;
    hash = "sha256-YCn/MDSDgrntbFZBJ9eQ5KM74fx7+r0aMdW3jOGJ5+w=";
  };

  pythonRelaxDeps = [
    "cryptography"
  ];

  nativeBuildInputs = [
    rustPlatform.cargoSetupHook
    rustPlatform.maturinBuildHook
    perl
  ];

  dependencies = [
    cryptography
    pretend
  ];
  meta = {
    homepage = "https://github.com/trailofbits/rfc3161-client";
    license = lib.licenses.asl20;
    platforms = lib.platforms.all;
    description = "Opinionated Python RFC3161 Client";
  };
})
