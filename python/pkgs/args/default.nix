{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "args";
  version = "0.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-p4W42DdiXpthw5EIUy2VuFJ0rNZ5aTtx67UVaEj8+BQ=";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Command Arguments for Humans";
    homepage = "https://github.com/kennethreitz/args";
    license = lib.licenses.bsd2;
  };
})
