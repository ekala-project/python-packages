{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  eth-hash,
  eth-utils,
  hexbytes,
  rlp,
  sortedcontainers,
}:

buildPythonPackage rec {
  pname = "trie";
  version = "3.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "py-trie";
    tag = "v${version}";
    hash = "sha256-QDywlAyFbQGgkATVifdixlnob4Tmsvr/VZ1rafzWKrU=";
  };

  build-system = [ setuptools ];

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
    maintainers = [ ];
  };
}
