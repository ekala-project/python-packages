{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "frozendict";
  version = "2.5.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-t5sMEzIgxZdv8FuL/jwSFRGcqmJV9HejCRUf1eLCwMM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "frozendict" ];

  meta = {
    homepage = "https://github.com/Marco-Sulla/python-frozendict";
    description = "Module for immutable dictionary";
    license = lib.licenses.lgpl3Only;
  };
})
