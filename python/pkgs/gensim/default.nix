{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  cython,
  setuptools,

  # dependencies
  numpy,
  scipy,
  smart-open,
}:

buildPythonPackage (finalAttrs: {
  pname = "gensim";
  version = "4.4.0";
  pyproject = true;

  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "piskvorky";
    repo = "gensim";
    tag = finalAttrs.version;
    hash = "sha256-TXutcU43ReBj9ss9+zBJFUxb5JqVHpl+B0c7hqcJAJY=";
  };

  patches = [
    # Fall back to serial chunkize when the multiprocessing start method is not
    # "fork" (the default changed to "forkserver" on Linux with Python 3.14).
    # Vendored (filtered to gensim/utils.py) from the not yet merged
    # https://github.com/piskvorky/gensim/pull/3649
    ./python314-chunkize-forkserver.patch
  ];

  build-system = [
    cython
    setuptools
  ];

  dependencies = [
    numpy
    scipy
    smart-open
  ];
  pythonImportsCheck = [ "gensim" ];
  # test_parallel is flaky under load
  meta = {
    description = "Topic-modelling library";
    homepage = "https://radimrehurek.com/gensim/";
    downloadPage = "https://github.com/piskvorky/gensim";
    license = lib.licenses.lgpl21Only;
    maintainers = [ ];
  };
})
