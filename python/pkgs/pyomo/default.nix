{
  lib,
  buildPythonPackage,
  cython,
  fetchFromGitHub,
  ply,
  pybind11,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyomo";
  version = "6.10.1";
  pyproject = true;

  src = fetchFromGitHub {
    repo = "pyomo";
    owner = "pyomo";
    tag = finalAttrs.version;
    hash = "sha256-+LMjvUFGlRsWl8TaGC4ist63Gzwi+xfpeAnNY8Fws/M=";
  };

  build-system = [
    cython
    pybind11
    setuptools
  ];

  dependencies = [ ply ];

  pythonImportsCheck = [ "pyomo" ];

  meta = {
    description = "Python Optimization Modeling Objects";
    homepage = "http://www.pyomo.org/";
    license = lib.licenses.bsd3;
    mainProgram = "pyomo";
  };
})
