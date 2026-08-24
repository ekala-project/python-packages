{ lib
, buildPythonPackage
, cython
, fetchFromGitHub
, ply
, pybind11
, setuptools
,
}:

buildPythonPackage rec {
  pname = "pyomo";
  version = "6.9.5";
  pyproject = true;

  src = fetchFromGitHub {
    repo = "pyomo";
    owner = "pyomo";
    tag = version;
    hash = "sha256-DHA/OukSK1p65imJEZg7hbErJGL7aQiDbW4vUUuSEko=";
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
    maintainers = [ ];
    mainProgram = "pyomo";
  };
}
