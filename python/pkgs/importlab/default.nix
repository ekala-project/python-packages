{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  networkx,
}:

buildPythonPackage (finalAttrs: {
  pname = "importlab";
  version = "0.8.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-s4k4U7H26wJ9pQnDtA5nh+ld1mtLZvGzYTqtd1VuFGU=";
  };

  build-system = [ setuptools ];

  dependencies = [ networkx ];

  pythonImportsCheck = [ "importlab" ];

  meta = {
    description = "Library that automatically infers dependencies for Python files";
    homepage = "https://github.com/google/importlab";
    license = lib.licenses.mit;
  };
})
