{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  redis,
}:

buildPythonPackage (finalAttrs: {
  pname = "huey";
  version = "3.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-ec1j0RfluNot5YQg3N5OLQ+WPjYtZ6mzhyzlZe7Fw9w=";
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
