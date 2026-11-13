{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  lxml,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "ebooklib";
  version = "0.21";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-+oFdVE9yIyHJ/THYlXRzsmFwJ9MJFDGqaQ1t2T94UiI=";
  };

  build-system = [ setuptools ];

  dependencies = [
    lxml
    six
  ];

  pythonImportsCheck = [ "ebooklib" ];

  meta = {
    description = "Python E-book library for handling books in EPUB2/EPUB3 format";
    homepage = "https://github.com/aerkalov/ebooklib";
    license = lib.licenses.agpl3Only;
  };
})
