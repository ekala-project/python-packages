{
  lib,
  buildPythonPackage,
  setuptools,
  fetchPypi,
}:

buildPythonPackage rec {
  pname = "avro";
  version = "1.12.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-6QDntZpHgfY9npNeiPbsUMTWC+P0rfnGO1HtOdV4/gg=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "avro" ];

  meta = {
    description = "Python serialization and RPC framework";
    homepage = "https://github.com/apache/avro";
    license = lib.licenses.asl20;
    mainProgram = "avro";
  };
}
