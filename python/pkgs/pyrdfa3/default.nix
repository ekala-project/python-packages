{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  rdflib,
  html5lib,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyrdfa3";
  version = "3.6.5";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-D8KP8UJq+AWxAK/3Fi22pD+iFeN/krzpsRO0Zf61Y+o=";
  };

  build-system = [ setuptools ];

  dependencies = [
    rdflib
    html5lib
    requests
  ];

  pythonImportsCheck = [ "pyRdfa" ];

  meta = {
    description = "RDFa 1.1 distiller/parser library";
    homepage = "https://github.com/prrvchr/pyrdfa3/";
    license = lib.licenses.w3c;
  };
})
