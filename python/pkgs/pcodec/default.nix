{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  rustPlatform,

  numpy,
}:

buildPythonPackage rec {
  pname = "pcodec";
  version = "1.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pcodec";
    repo = "pcodec";
    tag = "v${version}";
    hash = "sha256-fL+UCaQ8GdIe7e4Y7VeaWkjoNwuXXqaW2fHkaWs+1Lw=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit pname version src;
    hash = "sha256-4RRN4gyEQdnpiljxa1kPM2/naarpFrKMoTVLpXD3f4A=";
  };

  buildAndTestSubdir = "pco_python";

  dependencies = [ numpy ];

  nativeBuildInputs = [
    rustPlatform.cargoSetupHook
    rustPlatform.maturinBuildHook
  ];
  pythonImportsCheck = [ "pcodec" ];

  meta = {
    description = "Lossless codec for numerical data";
    homepage = "https://github.com/pcodec/pcodec";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
