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
  version = "0.18.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pydata";
    repo = "sparse";
    tag = finalAttrs.version;
    hash = "sha256-HHZ47TAgNbEEZj1sEe85yQRleW4Un2wfwQyFp4BPCbI=";
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
    maintainers = [ ];
  };
})
