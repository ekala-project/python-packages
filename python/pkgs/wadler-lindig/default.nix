{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # tests
  numpy,
}:

buildPythonPackage rec {
  pname = "wadler-lindig";
  version = "0.1.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "patrick-kidger";
    repo = "wadler_lindig";
    tag = "v${version}";
    hash = "sha256-qP826zdzR5BEQ8bGd45RFSLTH6Eal+b7UN+BW07/glo=";
  };

  build-system = [
    hatchling
  ];

  pythonImportsCheck = [
    "wadler_lindig"
  ];
  meta = {
    description = "Wadler--Lindig pretty printer for Python";
    homepage = "https://github.com/patrick-kidger/wadler_lindig";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
