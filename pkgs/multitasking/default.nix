{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "multitasking";
  version = "0.0.13";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-2Ja134d8nKXu3b8OWZQSRpTWy1NaummPsjNExwJRVaE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "multitasking" ];

  meta = {
    description = "Non-blocking Python methods using decorators";
    homepage = "https://github.com/ranaroussi/multitasking";
    license = lib.licenses.asl20;
  };
})
