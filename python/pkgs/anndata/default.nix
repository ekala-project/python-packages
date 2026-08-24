{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  hatch-vcs
, hatchling
, # dependencies
  array-api-compat
, h5py
, legacy-api-wrap
, natsort
, numpy
, pandas
, scipy
, scverse-misc
, zarr
, pytest-xdist
,
}:

buildPythonPackage (finalAttrs: {
  pname = "anndata";
  version = "0.13.2";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "scverse";
    repo = "anndata";
    tag = finalAttrs.version;
    hash = "sha256-Iw8LJklySaJGcyvtv6nl81xC63+bALtmH83H+LidHkQ=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  dependencies = [
    array-api-compat
    h5py
    legacy-api-wrap
    natsort
    numpy
    pandas
    scipy
    scverse-misc
    zarr
  ];
  pythonImportsCheck = [ "anndata" ];

  # Optionally disable pytest-xdist to make it easier to debug the test suite.
  # fail when running without pytest-xdist ("worker_id not found").
  # pytestFlags = [ "-oaddopts=" ];

  meta = {
    description = "Python package for handling annotated data matrices in memory and on disk";
    homepage = "https://anndata.readthedocs.io/";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
