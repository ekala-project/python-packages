{ lib
, fetchPypi
, buildPythonPackage
, boost-histogram
, histoprint
, hatchling
, hatch-vcs
, numpy
,
}:

buildPythonPackage (finalAttrs: {
  pname = "hist";
  version = "2.10.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-3sjmrHmm1k7Ihzzzaz7wOUx5r/Ow6Kvtcf3Hf9xCGy4=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    boost-histogram
    histoprint
    numpy
  ];

  pythonImportsCheck = [ "hist" ];

  meta = {
    description = "Histogramming for analysis powered by boost-histogram";
    mainProgram = "";
    homepage = "https://hist.readthedocs.io/";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
