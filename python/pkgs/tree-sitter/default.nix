{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "tree-sitter";
  version = "0.26.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tree-sitter";
    repo = "py-tree-sitter";
    tag = "v${version}";
    hash = "sha256-f1D7MdAWqVaYY0M0d+mR+AGNJjXOc41NGqbYG6ruLR4=";
    fetchSubmodules = true;
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "tree_sitter" ];

  meta = {
    description = "Python bindings to the Tree-sitter parsing library";
    homepage = "https://github.com/tree-sitter/py-tree-sitter";
    license = lib.licenses.mit;
  };
}
