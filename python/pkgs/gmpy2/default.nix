{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  isPyPy,
  setuptools,
  gmp,
  mpfr,
  libmpc,
}:

buildPythonPackage (finalAttrs: {
  pname = "gmpy2";
  version = "2.2.2";
  pyproject = true;

  disabled = isPyPy;

  src = fetchFromGitHub {
    owner = "aleaxit";
    repo = "gmpy";
    tag = "v${finalAttrs.version}";
    hash = "sha256-joeHec/d82sovfASCU3nlNL6SaThnS/XYPqujiZ9h8s=";
  };

  build-system = [ setuptools ];

  buildInputs = [
    gmp
    mpfr
    libmpc
  ];

  # make relative imports in tests work properly
  pythonImportsCheck = [ "gmpy2" ];

  meta = {
    description = "Interface to GMP, MPFR, and MPC for Python 3.7+";
    homepage = "https://github.com/aleaxit/gmpy/";
    license = lib.licenses.lgpl3Plus;
    maintainers = [ ];
  };
})
