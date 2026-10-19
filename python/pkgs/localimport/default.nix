{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "localimport";
  version = "1.7.6";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-8UhaZyGdN/N6UwR7pPYQR2hZCz3TrBxr1KOBJRx28ok=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "localimport" ];

  meta = {
    homepage = "https://github.com/NiklasRosenstein/py-localimport";
    description = "Isolated import of Python modules";
    license = lib.licenses.mit;
  };
})
