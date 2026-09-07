{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  redis,
}:

buildPythonPackage (finalAttrs: {
  pname = "huey";
  version = "3.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-rJsC50HxPaQJLqGbyq/HNmnpfTFTkU0v7Sho3xRPbfo=";
  };

  build-system = [ setuptools ];

  dependencies = [ redis ];

  pythonImportsCheck = [ "huey" ];

  meta = {
    description = "Module to queue tasks";
    homepage = "https://github.com/coleifer/huey";
    changelog = "https://github.com/coleifer/huey/blob/${finalAttrs.version}/CHANGELOG.md";
    license = lib.licenses.mit;
  };
})
