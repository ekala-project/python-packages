{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  beautifulsoup4,
}:

buildPythonPackage (finalAttrs: {
  pname = "google";
  version = "3.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-FDUwEi7lEwUJrV6YnwUS98shiy1O3br7rUD9EOjYzL4=";
  };

  build-system = [ setuptools ];

  dependencies = [ beautifulsoup4 ];

  # Module has no tests

  pythonImportsCheck = [ "googlesearch" ];

  meta = {
    description = "Python bindings to the Google search engine";
    mainProgram = "google";
    homepage = "https://pypi.org/project/google/";
    license = lib.licenses.bsd3;
  };
})
