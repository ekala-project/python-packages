{
  lib,
  buildPythonPackage,
  setuptools,
  fetchPypi,
}:

buildPythonPackage rec {
  pname = "avro";
  version = "1.12.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-xbjdLdTBCBbw3BJ8wpz9Q7XkBc9+aEDolGCgJL89CY0=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "avro" ];

  meta = {
    description = "Python serialization and RPC framework";
    homepage = "https://github.com/apache/avro";
    license = lib.licenses.asl20;
    maintainers = [ ];
    mainProgram = "avro";
  };
}
