{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pyrsistent";
  version = "0.20.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-TEj3j2KrWWxnkIYITQ3RMlSuTz1scqg//fXr3vjyZaQ=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "pyrsistent" ];

  meta = {
    homepage = "https://github.com/tobgu/pyrsistent/";
    description = "Persistent/Functional/Immutable data structures";
    license = lib.licenses.mit;
  };
}
