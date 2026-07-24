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

buildPythonPackage rec {
  pname = "ebooklib";
  version = "0.20";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-NeL519OZB76NOa4t6yYbGYSJRZA649u2V3sYfq1p6YU=";
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
}
