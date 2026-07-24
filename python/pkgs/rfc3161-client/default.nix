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
  version = "1.0.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "trailofbits";
    repo = "rfc3161-client";
    tag = "v${finalAttrs.version}";
    hash = "sha256-8OjohrHqUgsKXRZ28Au6Un6Wlzh81XVSQosoQC2f+Fs=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) src pname;
    hash = "sha256-jQsogV+qR0jAkHz/Slg9oBO/f96osU8YcjuaX4ZJQTk=";
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
    maintainers = [ ];
    license = lib.licenses.asl20;
    platforms = lib.platforms.all;
    description = "Opinionated Python RFC3161 Client";
  };
})
