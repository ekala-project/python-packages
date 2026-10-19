{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  numpy,
  scipy,
}:

buildPythonPackage (finalAttrs: {
  pname = "miniful";
  version = "0.0.6";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-ZCyfNrh8gbPvwplHN5tbmbjTMYXJBKe8Mg2JqOGHFCk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    numpy
    scipy
  ];

  # Module has no tests

  pythonImportsCheck = [ "miniful" ];

  meta = {
    description = "Minimal Fuzzy Library";
    homepage = "https://github.com/aresio/miniful";
    license = lib.licenses.lgpl3Only;
  };
})
