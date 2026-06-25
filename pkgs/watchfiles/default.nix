{
  lib,
  anyio,
  buildPythonPackage,
  fetchFromGitHub,
  rustPlatform,
}:

buildPythonPackage (finalAttrs: {
  pname = "watchfiles";
  version = "1.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "samuelcolvin";
    repo = "watchfiles";
    tag = "v${finalAttrs.version}";
    hash = "sha256-UlQnCYSNU9H4x31KenSfYExGun94ekrOCwajORemSco=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) pname src version;
    hash = "sha256-6sxtH7KrwAWukPjLSMAebguPmeAHbC7YHOn1QiRPigs=";
  };

  nativeBuildInputs = [
    rustPlatform.cargoSetupHook
    rustPlatform.maturinBuildHook
  ];

  dependencies = [ anyio ];

  # Tests need these permissions in order to use the FSEvents API on macOS.
  sandboxProfile = ''
    (allow mach-lookup (global-name "com.apple.FSEvents"))
  '';

  pythonImportsCheck = [ "watchfiles" ];

  meta = {
    description = "File watching and code reload";
    homepage = "https://watchfiles.helpmanual.io/";
    license = lib.licenses.mit;
    mainProgram = "watchfiles";
  };
})
