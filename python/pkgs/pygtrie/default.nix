{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pygtrie";
  version = "2.6.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-h5JkWXdD71K/gPLf8IU2QIjAhIriJUTbldrSv1LgZHE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pygtrie" ];

  meta = {
    description = "Trie data structure implementation";
    homepage = "https://github.com/mina86/pygtrie";
    license = lib.licenses.asl20;
  };
})
