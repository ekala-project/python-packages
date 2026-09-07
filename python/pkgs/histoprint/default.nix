{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  hatchling,
  hatch-vcs,
  click,
  numpy,
  uhi,
}:

buildPythonPackage rec {
  pname = "histoprint";
  version = "2.7.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "scikit-hep";
    repo = "histoprint";
    tag = "v${version}";
    hash = "sha256-yYPFGFrw4JV5Abu2kbNcwsnVtCNvnqhCl4cbX95wzQ8=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    click
    numpy
    uhi
  ];

  meta = {
    description = "Pretty print histograms to the console";
    mainProgram = "histoprint";
    homepage = "https://github.com/scikit-hep/histoprint";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
