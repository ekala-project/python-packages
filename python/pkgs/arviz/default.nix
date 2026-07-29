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
  version = "1.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "arviz-devs";
    repo = "arviz";
    tag = "v${finalAttrs.version}";
    hash = "sha256-pbYc9ofBTAZ9e7IqAgHXT0EXhbQzovSdc6X3SysAKhw=";
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
