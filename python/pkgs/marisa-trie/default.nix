{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  replaceVars,
  pkgs,
  cython,
  setuptools,
}:

buildPythonPackage rec {
  pname = "marisa-trie";
  version = "1.4.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pytries";
    repo = "marisa-trie";
    tag = version;
    hash = "sha256-U3gntlvJ0IaWoK+2V0OQ/XoDLfQsSbrrsSj95VR1m+4=";
  };

  patches = [
    (replaceVars ./unvendor-marisa.patch {
      marisa = lib.getDev pkgs.marisa;
    })
  ];

  build-system = [
    cython
    setuptools
  ];

  buildInputs = [
    pkgs.marisa
  ];

  pythonImportsCheck = [ "marisa_trie" ];

  meta = {
    description = "Static memory-efficient Trie-like structures for Python based on marisa-trie C++ library";
    longDescription = ''
      There are official SWIG-based Python bindings included in C++ library distribution.
      This package provides alternative Cython-based pip-installable Python bindings.
    '';
    homepage = "https://github.com/kmike/marisa-trie";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
