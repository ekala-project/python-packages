{
  lib,
  fetchPypi,
  buildPythonPackage,
  poetry-core,
  jsonpatch,
  jsonschema,
}:

buildPythonPackage rec {
  pname = "warlock";
  version = "2.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-mau/lSWyp38s3oltOp8YpbRZDbBj22XgggdpTS4BN/w=";
  };

  build-system = [ poetry-core ];

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
