{
  stdenv,
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  cython,
  gfortran,
  meson-python,
  numpy,
  scipy,

  # native dependencies
  glibcLocales,
  llvmPackages,
  pillow,
  joblib,
  narwhals,
  threadpoolctl,
}:

buildPythonPackage rec {
  __structuredAttrs = true;

  pname = "scikit-learn";
  version = "1.9.0";
  pyproject = true;

  src = fetchPypi {
    pname = "scikit_learn";
    inherit version;
    hash = "sha256-iDMmaYnTpREBeKn64weDZ1Rgck0OHvsTsUkB0sZgxVc=";
  };

  postPatch = ''
    substituteInPlace meson.build --replace-fail \
      "run_command('sklearn/_build_utils/version.py', check: true).stdout().strip()," \
      "'${version}',"
    substituteInPlace pyproject.toml \
      --replace-fail "meson-python>=0.17.1,<0.20.0" meson-python \
      --replace-fail "numpy>=2,<2.5.0" numpy \
      --replace-fail "scipy>=1.10.0,<1.18.0" scipy \
      --replace-fail "cython>=3.1.2,<3.3.0" cython
  '';

  buildInputs = [
    numpy.blas
    pillow
    glibcLocales
  ]
  ++ lib.optionals stdenv.cc.isClang [ llvmPackages.openmp ];

  nativeBuildInputs = [
    gfortran
  ];

  build-system = [
    cython
    meson-python
    numpy
    scipy
  ];

  dependencies = [
    joblib
    narwhals
    numpy
    scipy
    threadpoolctl
  ];

  pythonRelaxDeps = [
    "numpy"
    "scipy"
  ];

  env.LC_ALL = "en_US.UTF-8";

  doCheck = false;

  pythonImportsCheck = [ "sklearn" ];

  meta = {
    description = "Set of python modules for machine learning and data mining";
    homepage = "https://scikit-learn.org";
    license = lib.licenses.bsd3;
  };
}
