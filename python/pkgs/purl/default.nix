{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "purl";
  version = "1.6";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-ugurrb0MmBxJWkVxXFRK00za01EC6Z+0/NenhiVifOM=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "purl" ];

  meta = {
    description = "Immutable URL class for easy URL-building and manipulation";
    homepage = "https://github.com/codeinthehole/purl";
    license = lib.licenses.mit;
  };
})
