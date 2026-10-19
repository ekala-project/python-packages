{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,

  cython,
  numpy,
  scipy,
  scikit-learn,
  joblib,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "hdbscan";
  version = "0.8.44";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "scikit-learn-contrib";
    repo = "hdbscan";
    tag = "release-${finalAttrs.version}";
    hash = "sha256-mJz2CGiAgrz1M5w8XwCRjgQFBygQdVKyi2B8wFHWqGI=";
  };

  build-system = [ setuptools ];

  pythonRemoveDeps = [ "cython" ];

  nativeBuildInputs = [
    cython
    joblib
    numpy
    scikit-learn
    scipy
    six
  ];
  pythonImportsCheck = [ "hdbscan" ];

  meta = {
    description = "Hierarchical Density-Based Spatial Clustering of Applications with Noise, a clustering algorithm with a scikit-learn compatible API";
    homepage = "https://github.com/scikit-learn-contrib/hdbscan";
    license = lib.licenses.bsd3;
  };
})
