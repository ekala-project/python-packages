{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  numpy,
  scipy,
  setuptools,
}:

buildPythonPackage rec {
  pname = "tensorly";
  version = "0.9.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tensorly";
    repo = "tensorly";
    tag = version;
    hash = "sha256-A6Zlp8fa7XFgf4qpg7SEtNLlYSNtDGLuRUEfzD+crQc=";
  };

  build-system = [ setuptools ];

  dependencies = [
    numpy
    scipy
  ];

  pythonImportsCheck = [
    "tensorly"
    "tensorly.base"
    "tensorly.cp_tensor"
    "tensorly.tucker_tensor"
    "tensorly.tt_tensor"
    "tensorly.tt_matrix"
    "tensorly.parafac2_tensor"
    "tensorly.tenalg"
    "tensorly.decomposition"
    "tensorly.regression"
    "tensorly.solvers"
    "tensorly.metrics"
    "tensorly.random"
    "tensorly.datasets"
    "tensorly.plugins"
    "tensorly.contrib"
  ];

  meta = {
    description = "Tensor learning in Python";
    homepage = "https://tensorly.org/";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
