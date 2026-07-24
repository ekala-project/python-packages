{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "cobs";
  version = "1.2.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-291eMhEdcnhvg9DCaSFdzWrGKbGsGWLGh4Ih87LKmNo=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "cobs" ];

  meta = {
    description = "Python functions for encoding and decoding COBS";
    homepage = "https://github.com/cmcqueen/cobs-python/";
    license = lib.licenses.mit;
  };
}
