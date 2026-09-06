{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  flit-core,

  # dependencies
  arviz-base,
  arviz-plots,
  arviz-stats,
}:

buildPythonPackage (finalAttrs: {
  pname = "arviz";
  version = "1.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "arviz-devs";
    repo = "arviz";
    tag = "v${finalAttrs.version}";
    hash = "sha256-YQ+0dUXl432cTtBJCNzekHtTiA+c25Q/1P2iqHj+TXk=";
  };

  build-system = [ flit-core ];

  dependencies = [
    arviz-base
    arviz-plots
    arviz-stats
  ]
  ++ arviz-stats.optional-dependencies.xarray;

  pythonImportsCheck = [ "arviz" ];

  meta = {
    description = "Library for exploratory analysis of Bayesian models";
    homepage = "https://arviz-devs.github.io/arviz/";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
