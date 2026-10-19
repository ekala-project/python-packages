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

buildPythonPackage (finalAttrs: {
  pname = "pybtex-docutils";
  version = "1.0.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-On69+StZPgDowcU4qpogvKXZLYQjESRxWsyWTVHZPGs=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pybtex
    docutils
  ];

  pythonImportsCheck = [ "pybtex_docutils" ];

  meta = {
    description = "Docutils backend for pybtex";
    homepage = "https://github.com/mcmtroffaes/pybtex-docutils";
    license = lib.licenses.mit;
  };
})
