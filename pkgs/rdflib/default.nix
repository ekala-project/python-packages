{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  poetry-core,

  # dependencies
  pyparsing,

  # optional-dependencies
  networkx,
}:

buildPythonPackage rec {
  pname = "rdflib";
  version = "7.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ZjCDRDkIsYMOVnNQ1y502ZSLMQ+CeWY1jXbuvckr9ZI=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    pyparsing
  ];

  optional-dependencies = {
    networkx = [ networkx ];
  };

  doCheck = false;

  pythonImportsCheck = [ "rdflib" ];

  meta = {
    homepage = "https://rdflib.readthedocs.io";
    description = "Python library for working with RDF";
    license = lib.licenses.bsd3;
  };
}
