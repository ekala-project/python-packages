{ lib
, buildPythonPackage
, fetchFromGitHub
, numpy
, packaging
, quantities
, setuptools
,
}:

buildPythonPackage rec {
  pname = "neo";
  version = "0.14.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "NeuralEnsemble";
    repo = "python-neo";
    tag = version;
    hash = "sha256-IB+RuQBJTu0Ss7PLdBpONBl50xdTiR512ni+w3Z+DEM=";
  };

  build-system = [ setuptools ];

  dependencies = [
    numpy
    packaging
    quantities
  ];

  pythonImportsCheck = [ "neo" ];

  meta = {
    description = "Package for representing electrophysiology data";
    homepage = "https://neuralensemble.org/neo/";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
