{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  cloudpickle,
  cython,
  ipython,
  lime,
  matplotlib,
  numba,
  numpy,
  pandas,
  scikit-learn,
  scipy,
  setuptools,
  setuptools-scm,
  slicer,
  tqdm,
}:

buildPythonPackage rec {
  pname = "shap";
  version = "0.50.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "slundberg";
    repo = "shap";
    tag = "v${version}";
    hash = "sha256-sf9EYa15/5xEOtHSesuq97dFP4frtteoGSpHE8kGP9Q=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "cython>=3.0.11" cython \
      --replace-fail "numpy>=2.0" "numpy"
  '';

  build-system = [
    cython
    numpy
    setuptools
    setuptools-scm
  ];

  dependencies = [
    cloudpickle
    numba
    numpy
    pandas
    scikit-learn
    scipy
    slicer
    tqdm
  ];

  pythonRelaxDeps = [
    "numba"
    "llvmlite"
  ];

  optional-dependencies = {
    plots = [
      matplotlib
      ipython
    ];
    others = [ lime ];
  };

  pythonImportsCheck = [ "shap" ];

  meta = {
    description = "Unified approach to explain the output of any machine learning model";
    homepage = "https://github.com/slundberg/shap";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
