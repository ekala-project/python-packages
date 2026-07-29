{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pythonAtLeast,
  setuptools,
  cached-property,
  ckzg,
  eth-bloom,
  eth-keys,
  eth-typing,
  eth-utils,
  lru-dict,
  pydantic,
  py-ecc,
  rlp,
  trie,
}:

buildPythonPackage (finalAttrs: {
  pname = "py-evm";
  version = "0.12.1-beta.1";
  pyproject = true;

  disabled = pythonAtLeast "3.14";

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "py-evm";
    tag = "v${finalAttrs.version}";
    hash = "sha256-n2F0ApdmIED0wrGuNN45lyb7cGu8pRn8mLDehT7Ru9E=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cached-property
    ckzg
    eth-bloom
    eth-keys
    eth-typing
    eth-utils
    lru-dict
    pydantic
    py-ecc
    rlp
    trie
  ];

  pythonImportsCheck = [ "eth" ];

  meta = {
    description = "Python implementation of the Ethereum Virtual Machine";
    homepage = "https://github.com/ethereum/py-evm";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
