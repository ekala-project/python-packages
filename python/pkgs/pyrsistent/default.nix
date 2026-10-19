{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyrsistent";
  version = "0.20.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-TEj3j2KrWWxnkIYITQ3RMlSuTz1scqg//fXr3vjyZaQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pyrsistent" ];

  meta = {
    homepage = "https://github.com/tobgu/pyrsistent/";
    description = "Persistent/Functional/Immutable data structures";
    license = lib.licenses.mit;
  };
})
