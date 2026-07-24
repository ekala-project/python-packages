{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "types-certifi";
  version = "2021.10.8.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-cs93mNFlvAt24cEN0eowl8cGPELCHWZFI7ko6ItVSk8=";
  };

  build-system = [ setuptools ];

  # No tests
  doCheck = false;

  meta = {
    description = "Typing stubs for certifi";
    homepage = "https://github.com/python/typeshed";
    license = lib.licenses.asl20;
  };
})
