{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "repoze-lru";
  version = "0.7";
  pyproject = true;

  src = fetchPypi {
    pname = "repoze.lru";
    inherit version;
    hash = "sha256-BCmnXhk4Dk7VDAaU4mrIgZtOp4Ue4fx1g8hXLbgK/3c=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "repoze.lru" ];

  pythonNamespaces = [ "repoze" ];

  doCheck = false;

  meta = {
    homepage = "http://www.repoze.org/";
    description = "Tiny LRU cache implementation and decorator";
    license = lib.licenses.bsd0;
  };
}
