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
  version = "3.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-4+y/Y0XkaxlYsoa9GwkMW6/6lCAV7PBLRKjMY4MPipI=";
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
