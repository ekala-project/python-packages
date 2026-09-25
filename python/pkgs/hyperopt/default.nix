{
  lib,
  buildPythonPackage,
  cloudpickle,
  fetchPypi,
  hatch-vcs,
  hatchling,
  networkx,
  numpy,
  scipy,
  tqdm,
}:

buildPythonPackage rec {
  pname = "hyperopt";
  version = "0.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-15p3Ui/v7BOiWLl6DMvfQIMrMnDeTbCCeLsHubk065o=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    cloudpickle
    networkx
    numpy
    scipy
    tqdm
  ];

  # tries to use /homeless-shelter to mimic container usage, etc
  pythonImportsCheck = [ "hyperopt" ];

  meta = {
    description = "Distributed Asynchronous Hyperparameter Optimization";
    mainProgram = "hyperopt-mongo-worker";
    homepage = "http://hyperopt.github.io/hyperopt/";
    license = lib.licenses.bsd3;
    platforms = lib.platforms.unix;
  };
}
