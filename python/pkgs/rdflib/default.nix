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
  version = "7.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-bIMSiNXkpafs6F0MzemHfVEqPQ8C18BkVdANbQ6jed8=";
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
