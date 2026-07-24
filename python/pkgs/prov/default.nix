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

buildPythonPackage rec {
  pname = "prov";
  version = "2.5.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-vhOaMyhpOjEiqNJv7IJ+U+M+Ctz7Kp56jJXRprjERrw=";
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
}
