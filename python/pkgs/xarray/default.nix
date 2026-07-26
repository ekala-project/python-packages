{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  numpy,
  packaging,
  pandas,

  # optional-dependencies
  bottleneck,
  cftime,
  dask,
  fsspec,
  h5netcdf,
  netcdf4,
  numba,
  opt-einsum,
  pooch,
  scipy,
}:

buildPythonPackage (finalAttrs: {
  pname = "xarray";
  version = "2026.07.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pydata";
    repo = "xarray";
    tag = "v${finalAttrs.version}";
    hash = "sha256-dj6V/HkHRm1kjHlAHUjN7pGCa1ioW11o1fdKUyxI8e0=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    numpy
    packaging
    pandas
  ];

  optional-dependencies = {
    accel = [
      bottleneck
      numba
      opt-einsum
      scipy
    ];
    io = [
      netcdf4
      h5netcdf
      scipy
      fsspec
      cftime
      pooch
    ];
    parallel = [ dask ] ++ dask.optional-dependencies.complete;
  };

  pythonImportsCheck = [ "xarray" ];

  meta = {
    description = "N-D labeled arrays and datasets in Python";
    homepage = "https://github.com/pydata/xarray";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
