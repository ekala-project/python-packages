{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "cobs";
  version = "1.2.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-291eMhEdcnhvg9DCaSFdzWrGKbGsGWLGh4Ih87LKmNo=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "cobs" ];

  meta = {
    description = "Python functions for encoding and decoding COBS";
    homepage = "https://github.com/cmcqueen/cobs-python/";
    license = lib.licenses.mit;
  };
})
