{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "repoze-lru";
  version = "0.8";
  pyproject = true;

  src = fetchPypi {
    pname = "repoze_lru";
    inherit (finalAttrs) version;
    hash = "sha256-olJAjNk/5nDIjWZluW/l1C4HHbolB6HyGh5gmuT6iRo=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "repoze.lru" ];

  pythonNamespaces = [ "repoze" ];

  meta = {
    homepage = "http://www.repoze.org/";
    description = "Tiny LRU cache implementation and decorator";
    license = lib.licenses.bsd0;
  };
})
