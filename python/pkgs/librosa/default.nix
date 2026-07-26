{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  audioread,
  decorator,
  joblib,
  lazy-loader,
  matplotlib,
  msgpack,
  numba,
  numpy,
  pooch,
  scikit-learn,
  scipy,
  soundfile,
  soxr,
  standard-aifc,
  standard-sunau,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "librosa";
  version = "0.11.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "librosa";
    repo = "librosa";
    tag = finalAttrs.version;
    fetchSubmodules = true; # for test data
    hash = "sha256-T58J/Gi3tHzelr4enbYJi1KmO46QxE5Zlhkc0+EgvRg=";
  };

  patches = [
    # <https://github.com/librosa/librosa/pull/1977>
    ./fix-with-numba-0.62.0.patch
  ];

  build-system = [ setuptools ];

  dependencies = [
    audioread
    decorator
    joblib
    lazy-loader
    msgpack
    numba
    numpy
    pooch
    scikit-learn
    scipy
    soundfile
    soxr
    standard-aifc
    standard-sunau
    typing-extensions
  ];

  optional-dependencies.matplotlib = [ matplotlib ];

  # check that import works, this allows to capture errors like https://github.com/librosa/librosa/issues/1160
  pythonImportsCheck = [ "librosa" ];
  meta = {
    description = "Python library for audio and music analysis";
    homepage = "https://github.com/librosa/librosa";
    license = lib.licenses.isc;
    maintainers = [ ];
  };
})
