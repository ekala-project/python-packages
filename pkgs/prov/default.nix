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
  version = "2.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-fQErFk9bu0LhGO2dJXiKsBLQkIK3Iryd1OgRownqV/U=";
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
