{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  eth-hash,
  eth-utils,
  hexbytes,
  rlp,
  sortedcontainers,
}:

buildPythonPackage rec {
  pname = "trie";
  version = "4.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "py-trie";
    tag = "v${version}";
    hash = "sha256-njjIvBYavpMKr1DsBeWzHQzeP+3ACwpItUySxMcTlNY=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    eth-hash
    eth-utils
    hexbytes
    rlp
    sortedcontainers
  ];

  pythonImportsCheck = [ "trie" ];

  meta = {
    description = "Python library which implements the Ethereum Trie structure";
    homepage = "https://github.com/ethereum/py-trie";
    license = lib.licenses.mit;
  };
}
