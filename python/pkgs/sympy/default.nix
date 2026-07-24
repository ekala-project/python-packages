{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  mpmath,
}:

buildPythonPackage (finalAttrs: {
  pname = "sympy";
  version = "1.14.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "sympy";
    repo = "sympy";
    tag = "sympy-${finalAttrs.version}";
    hash = "sha256-aSMQ/H5agjsa+Lp7o15/irLSTLtmF/VEqMCBGbXbvmM=";
  };

  build-system = [
    setuptools
  ];

  pythonRelaxDeps = [
    "mpmath"
  ];
  dependencies = [
    mpmath
  ];

  doCheck = false;
  pythonImportsCheck = [ "sympy" ];

  meta = {
    description = "Python library for symbolic mathematics";
    mainProgram = "isympy";
    homepage = "https://www.sympy.org/";
    downloadPage = "https://github.com/sympy/sympy";
    license = lib.licenses.bsd3;
  };
})
