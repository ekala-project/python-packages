{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  pytest,
  py-cpuinfo,
}:

buildPythonPackage rec {
  pname = "pytest-benchmark";
  version = "5.2.3";
  pyproject = true;

  src = fetchPypi {
    pname = "pytest_benchmark";
    inherit version;
    hash = "sha256-3rcxeZiiPGUP1P924SMAZqdstF3OzgrKVgcUPGGed3k=";
  };

  build-system = [ setuptools ];

  buildInputs = [ pytest ];

  dependencies = [ py-cpuinfo ];

  doCheck = false;

  pythonImportsCheck = [ "pytest_benchmark" ];

  meta = {
    description = "Pytest fixture for benchmarking code";
    homepage = "https://github.com/ionelmc/pytest-benchmark";
    license = lib.licenses.bsd2;
  };
}
