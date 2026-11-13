{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,
  versioneer,

  # dependencies
  arviz,
  cachetools,
  cloudpickle,
  numpy,
  pandas,
  pytensor,
  rich,
  scipy,
  threadpoolctl,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "pymc";
  version = "6.3.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pymc-devs";
    repo = "pymc";
    tag = "v${finalAttrs.version}";
    hash = "sha256-OyJMOZzOCHWpxcm/EfOUU/erUqgETzhsmCJsn/99HpQ=";
  };

  build-system = [
    setuptools
    versioneer
  ];

  dependencies = [
    arviz
    cachetools
    cloudpickle
    numpy
    pandas
    pytensor
    rich
    scipy
    threadpoolctl
    typing-extensions
  ];

  pythonImportsCheck = [ "pymc" ];

  meta = {
    description = "Bayesian estimation, particularly using Markov chain Monte Carlo (MCMC)";
    homepage = "https://github.com/pymc-devs/pymc";
    license = lib.licenses.asl20;
  };
})
