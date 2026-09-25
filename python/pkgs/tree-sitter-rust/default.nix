{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  tree-sitter,
}:

buildPythonPackage rec {
  pname = "tree-sitter-rust";
  version = "0.24.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tree-sitter";
    repo = "tree-sitter-rust";
    tag = "v${version}";
    hash = "sha256-Ls6tB6IxXDQDWwx0BJ7RgbheelC4MH8z97E7wwhkDcY=";
  };

  build-system = [
    setuptools
  ];

  optional-dependencies = {
    core = [
      tree-sitter
    ];
  };

  # There are no tests
  doCheck = false;
  pythonImportsCheck = [ "tree_sitter_rust" ];

  meta = {
    description = "Rust grammar for tree-sitter";
    homepage = "https://github.com/tree-sitter/tree-sitter-rust";
    license = lib.licenses.mit;
  };
}
