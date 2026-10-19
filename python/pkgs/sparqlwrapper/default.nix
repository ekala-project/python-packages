{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  keepalive,
}:

buildPythonPackage rec {
  pname = "sparqlwrapper";
  version = "2.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "SPARQLWrapper";
    inherit version;
    hash = "sha256-P+0+vMd2F6SnTSZEuG/Yjg8y5/cAOseyszTAJiAXMfE=";
  };

  build-system = [ setuptools ];

  # break circular dependency loop
  patchPhase = ''
    sed -i '/rdflib/d' setup.cfg
  '';

  # Doesn't actually run tests

  dependencies = [ keepalive ];

  meta = {
    description = "This is a wrapper around a SPARQL service. It helps in creating the query URI and, possibly, convert the result into a more manageable format";
    mainProgram = "rqw";
    homepage = "http://rdflib.github.io/sparqlwrapper";
    license = lib.licenses.w3c;
  };
}
