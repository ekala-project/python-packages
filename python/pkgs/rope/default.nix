{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "rope";
  version = "1.15.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-fOMEqoY1DZRUUztoF9DHwBMBsKT601bYNytdd981dW8=";
  };

  build-system = [ setuptools ];

  pythonRemoveDeps = [ "pytoolconfig" ];

  pythonImportsCheck = [ "rope" ];

  meta = {
    description = "Python refactoring library";
    homepage = "https://github.com/python-rope/rope";
    license = lib.licenses.gpl3Plus;
  };
})
