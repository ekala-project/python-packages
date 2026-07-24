{
  lib,
  buildPythonPackage,
  cargo,
  fetchFromGitHub,
  libiconv,
  packaging,
  poetry-core,
  rustc,
  rustPlatform,
}:

buildPythonPackage rec {
  pname = "python-calamine";
  version = "0.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dimastbk";
    repo = "python-calamine";
    tag = "v${version}";
    hash = "sha256-vPI2SWOMwEpN0w7BWvFFz1eeXiU9t4xhdl3TpO39l/Q=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit pname version src;
    hash = "sha256-DR84RulbTpwipYKHLtXdCa8Yr2Irv1W1o3NrCT8FRq4=";
  };

  buildInputs = [ libiconv ];

  build-system = [
    cargo
    poetry-core
    rustPlatform.cargoSetupHook
    rustPlatform.maturinBuildHook
    rustc
  ];

  dependencies = [ packaging ];
  pythonImportsCheck = [ "python_calamine" ];

  meta = {
    description = "Python binding for calamine";
    homepage = "https://github.com/dimastbk/python-calamine";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "python-calamine";
  };
}
