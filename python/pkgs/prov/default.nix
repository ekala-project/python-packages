{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  lxml,
  networkx,
  pydot,
  python-dateutil,
  rdflib,
}:

buildPythonPackage (finalAttrs: {
  pname = "prov";
  version = "3.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-mmdbO4X5jFXCq4Ew6RD6gc9KBpQmA9nyqTolnzSNjUc=";
  };

  build-system = [ setuptools ];

  dependencies = [
    lxml
    networkx
    pydot
    python-dateutil
    rdflib
  ];

  pythonImportsCheck = [ "prov" ];

  meta = {
    description = "Python library for W3C Provenance Data Model (PROV)";
    homepage = "https://github.com/trungdong/prov";
    license = lib.licenses.mit;
  };
})
