{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  repoze-lru,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "routes";
  version = "2.5.1";
  pyproject = true;

  src = fetchPypi {
    pname = "Routes";
    inherit (finalAttrs) version;
    hash = "sha256-tjRkWaFfDLqwGkWpDD0lyvmA1HM9YotMwZUrhlEl0FM=";
  };

  build-system = [ setuptools ];

  dependencies = [
    repoze-lru
    six
  ];

  pythonImportsCheck = [ "routes" ];

  meta = {
    homepage = "https://github.com/bbangert/routes";
    description = "Re-implementation of the Rails routes system for mapping URLs to application actions";
    license = lib.licenses.mit;
  };
})
