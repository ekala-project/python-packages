{
  lib,
  pkgs,
  buildPythonPackage,
  fetchFromGitHub,
  replaceVars,
  cmake,
  numpy,
  pybind11,
  setuptools,
  scipy,
}:

buildPythonPackage rec {
  pname = "qdldl";
  version = "0.1.7.post5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "osqp";
    repo = "qdldl-python";
    tag = "v${version}";
    hash = "sha256-XHdvYWORHDYy/EIqmlmFQZwv+vK3I+rPIrvcEW1JyIw=";
  };

  # use up-to-date qdldl for CMake v4
  patches = [
    (replaceVars ./use-qdldl.patch {
      qdldl = pkgs.qdldl;
    })
  ];

  dontUseCmakeConfigure = true;

  build-system = [
    cmake
    numpy
    pybind11
    setuptools
  ];

  dependencies = [
    numpy
    scipy
  ];

  propagatedBuildInputs = [
    pkgs.qdldl
  ];

  pythonImportsCheck = [ "qdldl" ];

  meta = {
    description = "Python interface to the QDLDL";
    homepage = "https://github.com/osqp/qdldl-python";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
