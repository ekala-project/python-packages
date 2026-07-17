{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  pybtex,
  docutils,
}:

buildPythonPackage rec {
  pname = "pybtex-docutils";
  version = "1.0.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-On69+StZPgDowcU4qpogvKXZLYQjESRxWsyWTVHZPGs=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pybtex
    docutils
  ];

  doCheck = false;

  pythonImportsCheck = [ "pybtex_docutils" ];

  meta = {
    description = "Docutils backend for pybtex";
    homepage = "https://github.com/mcmtroffaes/pybtex-docutils";
    license = lib.licenses.mit;
  };
}
