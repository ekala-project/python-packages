{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  joblib,
  numpy,
  scikit-learn,
  scipy,
  threadpoolctl,
  sklearn-compat,
}:

buildPythonPackage rec {
  pname = "imbalanced-learn";
  version = "0.14.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "scikit-learn-contrib";
    repo = "imbalanced-learn";
    tag = version;
    hash = "sha256-uWln6+r9QsGnH4I4JQm2/y80zTQkAflVPlIN9KQNzy0=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    joblib
    numpy
    scikit-learn
    scipy
    threadpoolctl
    sklearn-compat
  ];

  pythonImportsCheck = [ "imblearn" ];

  meta = {
    description = "Library offering a number of re-sampling techniques commonly used in datasets showing strong between-class imbalance";
    homepage = "https://github.com/scikit-learn-contrib/imbalanced-learn";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
