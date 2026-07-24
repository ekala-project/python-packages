{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  redis,
}:

buildPythonPackage (finalAttrs: {
  pname = "huey";
  version = "3.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-4MKhVC5sOsuJSCHN6JXPnb9y5C3rJfVbLUQJaqMPjyQ=";
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
