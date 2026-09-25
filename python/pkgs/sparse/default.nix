{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  setuptools-scm,
  # dependencies
  numba,
  numpy,
  scipy,
}:

buildPythonPackage (finalAttrs: {
  pname = "sparse";
  version = "0.19.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pydata";
    repo = "sparse";
    tag = finalAttrs.version;
    hash = "sha256-9RXiM5t0U64kKjMnz8Ram0qQm8QKNrOnO3OnFR/shdg=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    numba
    numpy
    scipy
  ];

  pythonImportsCheck = [ "sparse" ];

  meta = {
    description = "Sparse n-dimensional arrays computations";
    homepage = "https://sparse.pydata.org/";
    downloadPage = "https://github.com/pydata/sparse/releases/tag/${finalAttrs.src.tag}";
    license = lib.licenses.bsd3;
  };
})
