{
  lib,
  buildPythonPackage,
  fetchPypi,
  importlib-resources,
  setuptools,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "typeshed_client";
  version = "2.12.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-VNz6Jfz/gs7csbUcA8GzxRphQJequP5J5DFq/2952cc=";
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
}
