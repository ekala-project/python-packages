{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "jsonpointer";
  version = "3.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-C4AcfbM6kEAk9gBNUm3MU7u4pKD04yv9EL6t9grfGQA=";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Resolve JSON Pointers in Python";
    mainProgram = "jsonpointer";
    homepage = "https://github.com/stefankoegl/python-json-pointer";
    license = lib.licenses.bsd2;
  };
})
