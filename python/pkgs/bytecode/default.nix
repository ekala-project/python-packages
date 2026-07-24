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
  version = "0.18.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-2VZPFWX+GuahFz5UTvQ6hfCT6DmX70WvZdDSUOtI16E=";
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
