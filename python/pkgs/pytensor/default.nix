{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,
  cython,
  versioneer,

  # dependencies
  cons,
  etuples,
  filelock,
  logical-unification,
  minikanren,
  numba,
  numpy,
  scipy,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytensor";
  version = "3.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pymc-devs";
    repo = "pytensor";
    tag = "rel-${finalAttrs.version}";
    postFetch = ''
      sed -i 's/git_refnames = "[^"]*"/git_refnames = " (tag: ${finalAttrs.src.tag})"/' $out/pytensor/_version.py
    '';
    hash = "sha256-pUI9E76LeCzs1Y51YM0z6awTQIj/WumIqJIgrLYKYEQ=";
  };

  # DeprecationWarning: scipy.linalg: the `lwork` keyword is deprecated
  postPatch = ''
    substituteInPlace pytensor/link/numba/dispatch/linalg/decomposition/qr.py \
      --replace-fail "lwork=lwork," ""
  '';

  build-system = [
    setuptools
    cython
    versioneer
  ];

  dependencies = [
    cons
    etuples
    filelock
    logical-unification
    minikanren
    numba
    numpy
    scipy
    setuptools
  ];

  pythonImportsCheck = [ "pytensor" ];

  meta = {
    description = "Python library to define, optimize, and efficiently evaluate mathematical expressions involving multi-dimensional arrays";
    mainProgram = "pytensor-cache";
    homepage = "https://github.com/pymc-devs/pytensor";
    license = lib.licenses.bsd3;
  };
})
