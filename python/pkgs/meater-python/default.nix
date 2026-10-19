{
  lib,
  aiohttp,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "meater-python";
  version = "0.0.8";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-86XJmKOc2MCyU9v0UAZsPCUL/kAXywOlQOIHaykNF1o=";
  };

  build-system = [ setuptools ];

  dependencies = [ aiohttp ];

  # Module has no tests

  pythonImportsCheck = [ "meater" ];

  meta = {
    description = "Library for the Apption Labs Meater cooking probe";
    homepage = "https://github.com/Sotolotl/meater-python";
    license = lib.licenses.asl20;
  };
})
