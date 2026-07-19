{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  psutil,
}:

buildPythonPackage rec {
  pname = "memory-profiler";
  version = "0.61.0";
  pyproject = true;

  src = fetchPypi {
    pname = "memory_profiler";
    inherit version;
    hash = "sha256-Tltz14ZKHRKS+3agPoKj5475NNBoKKaY2dradtogZ7A=";
  };

  build-system = [ setuptools ];

  dependencies = [ psutil ];

  pythonImportsCheck = [ "memory_profiler" ];

  meta = {
    description = "Module for monitoring memory usage of a process";
    homepage = "https://pypi.org/project/memory_profiler/";
    license = lib.licenses.bsd3;
  };
}
