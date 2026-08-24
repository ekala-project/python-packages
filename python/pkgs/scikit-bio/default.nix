{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  cython
, numpy
, setuptools
, # dependencies
  array-api-compat
, biom-format
, decorator
, h5py
, natsort
, pandas
, patsy
, requests
, scipy
, statsmodels
,
}:

buildPythonPackage (finalAttrs: {
  pname = "scikit-bio";
  version = "0.7.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "scikit-bio";
    repo = "scikit-bio";
    tag = finalAttrs.version;
    hash = "sha256-7cptpv7x/2KJbyMCZ4X6wVVUMx+CDcZ6nOtbeUoD5a0=";
  };

  build-system = [
    cython
    numpy
    setuptools
  ];

  dependencies = [
    array-api-compat
    biom-format
    decorator
    h5py
    natsort
    numpy
    pandas
    patsy
    requests
    scipy
    statsmodels
  ];

  # only the $out dir contains the built cython extensions, so we run the tests inside there
  # The trick above makes test collection fail on darwin:
  # PermissionError: [Errno 1] Operation not permitted: '/nix/.Trashes'
  pythonImportsCheck = [ "skbio" ];

  meta = {
    description = "Data structures, algorithms and educational resources for bioinformatics";
    homepage = "http://scikit-bio.org/";
    downloadPage = "https://github.com/scikit-bio/scikit-bio";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
