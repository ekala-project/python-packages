{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "logzero";
  version = "1.7.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-f3Pd0645NFcjbwgf/r0ESjqi5COkeubdtReauQ0K0II=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "logzero" ];

  meta = {
    homepage = "https://github.com/metachris/logzero";
    description = "Robust and effective logging for Python 2 and 3";
    license = lib.licenses.mit;
  };
}
