{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  flit-core,

  # dependencies
  numpy,
  scipy,

  # optional-dependencies
  numba,
  xarray-einstats,
  arviz-base,
  xarray,
}:

buildPythonPackage (finalAttrs: {
  pname = "arviz-stats";
  version = "1.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "arviz-devs";
    repo = "arviz-stats";
    tag = "v${finalAttrs.version}";
    hash = "sha256-DEIzHKy3s+Hm8i7I3q+y7icyVjTjUsXzojDfl8Yy8JA=";
  };

  build-system = [ flit-core ];

  dependencies = [
    numpy
    scipy
  ];

  optional-dependencies = {
    numba = [
      numba
      xarray-einstats
    ];
    xarray = [
      arviz-base
      xarray
      xarray-einstats
    ];
  };

  pythonImportsCheck = [ "arviz_stats" ];

  meta = {
    description = "Statistical computation and diagnostics for ArviZ";
    homepage = "https://github.com/arviz-devs/arviz-stats";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
