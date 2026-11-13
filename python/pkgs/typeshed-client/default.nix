{
  lib,
  buildPythonPackage,
  fetchPypi,
  importlib-resources,
  setuptools,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "typeshed_client";
  version = "2.15.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-wVRqd3BUvuISjie7ULRVQAoY+AlipQPVNQfa7OXD60U=";
  };

  build-system = [ setuptools ];

  dependencies = [
    importlib-resources
    typing-extensions
  ];

  pythonImportsCheck = [ "typeshed_client" ];

  meta = {
    description = "Retrieve information from typeshed and other typing stubs";
    homepage = "https://github.com/JelleZijlstra/typeshed_client";
    license = lib.licenses.mit;
  };
})
