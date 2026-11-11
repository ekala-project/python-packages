{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  redis,
}:

buildPythonPackage (finalAttrs: {
  pname = "huey";
  version = "3.5.4";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-Mo9aLdFAZiHl7bF9RWVa4jKtnzLAeVyo3Av8Eh3Xsww=";
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
