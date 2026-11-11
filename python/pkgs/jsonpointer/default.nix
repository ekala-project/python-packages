{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "jsonpointer";
  version = "3.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-R8hGUTs6TsRu7O8RBSB/ugdeKjZZBI42K9fa/w/DM0I=";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Resolve JSON Pointers in Python";
    mainProgram = "jsonpointer";
    homepage = "https://github.com/stefankoegl/python-json-pointer";
    license = lib.licenses.bsd2;
  };
})
