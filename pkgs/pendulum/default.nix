{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  isPyPy,

  # build-system
  poetry-core,
  rustPlatform,

  # native dependencies
  iconv,

  # dependencies
  python-dateutil,
  time-machine,
  tzdata,
}:

buildPythonPackage rec {
  pname = "pendulum";
  version = "3.1.0-unstable-2025-10-28";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sdispater";
    repo = "pendulum";
    rev = "2982f25feaad2e58ad1530d3b53cc30fc1c82bd6";
    hash = "sha256-1ULvlWLZx3z5eGmWJfrN46x0ohJ+mAxipm6l6rykGPY=";
  };

  cargoRoot = "rust";
  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit pname version src;
    sourceRoot = "${src.name}/rust";
    hash = "sha256-Ozg+TW/woJsqmbmyDsgdMua3Lmnn+KBvBhd9kVik3XY=";
  };

  nativeBuildInputs = [
    poetry-core
    rustPlatform.maturinBuildHook
    rustPlatform.cargoSetupHook
  ];

  buildInputs = lib.optionals stdenv.hostPlatform.isDarwin [ iconv ];

  propagatedBuildInputs = [
    python-dateutil
    tzdata
  ]
  ++ lib.optionals (!isPyPy) [
    time-machine
  ];

  pythonImportsCheck = [ "pendulum" ];

  meta = {
    description = "Python datetimes made easy";
    homepage = "https://github.com/sdispater/pendulum";
    license = lib.licenses.mit;
  };
}
