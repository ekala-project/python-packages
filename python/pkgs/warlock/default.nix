{
  lib,
  fetchPypi,
  buildPythonPackage,
  flit-core,
  jsonpatch,
  jsonschema,
}:

buildPythonPackage rec {
  pname = "warlock";
  version = "2.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-gjGboBc0Hn/NyB78K+ndL4I3oNoHxxR2tUJWUbMXsck=";
  };

  build-system = [ flit-core ];

  dependencies = [
    jsonpatch
    jsonschema
  ];

  doCheck = false;

  pythonImportsCheck = [ "warlock" ];

  meta = {
    homepage = "https://github.com/bcwaldon/warlock";
    description = "Python object model built on JSON schema and JSON patch";
    license = lib.licenses.asl20;
  };
}
