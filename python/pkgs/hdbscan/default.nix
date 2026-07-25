{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  cython,
  numpy,
  scipy,
  scikit-learn,
  joblib,
  six,
}:

buildPythonPackage rec {
  pname = "hdbscan";
  version = "0.8.41";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "scikit-learn-contrib";
    repo = "hdbscan";
    tag = "release-${version}";
    hash = "sha256-4uwWoNkrdLB2KzDAksPupdgkIFBgTahzravOtu1WYws=";
  };

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
    maintainers = [ ];
  };
}
