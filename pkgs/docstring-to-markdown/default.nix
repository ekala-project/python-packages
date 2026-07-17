{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  importlib-metadata,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "docstring-to-markdown";
  version = "0.17";
  pyproject = true;

  src = fetchPypi {
    inherit version;
    pname = "docstring_to_markdown";
    hash = "sha256-33KhEilMdJJIfJ2iRRyuD67uBuhgCCRcGIxXYclZDKM=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [
    importlib-metadata
    typing-extensions
  ];

  pythonImportsCheck = [ "docstring_to_markdown" ];

  meta = {
    homepage = "https://github.com/python-lsp/docstring-to-markdown";
    description = "On the fly conversion of Python docstrings to markdown";
    license = lib.licenses.lgpl2Plus;
  };
}
