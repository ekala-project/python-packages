{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "bytecode";
  version = "0.17.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-DDfvpb0VixuHP1MMzuosZFYR1VvS3CpHWLCfGFdJtv0=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "bytecode" ];

  meta = {
    description = "Python module to generate and modify bytecode";
    homepage = "https://github.com/vstinner/bytecode";
    license = lib.licenses.mit;
  };
}
