{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  bitarray,
  ckzg,
  eth-abi,
  eth-keyfile,
  eth-keys,
  eth-rlp,
  eth-utils,
  hexbytes,
  pydantic,
  rlp,
  websockets,
}:

buildPythonPackage rec {
  pname = "eth-account";
  version = "0.13.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "eth-account";
    tag = "v${version}";
    hash = "sha256-Ipz2zIKCpIzKBtX0UZnvpKZeTUcDPbGTzMgmcJC/4qs=";
  };

  build-system = [ setuptools ];

  dependencies = [
    bitarray
    ckzg
    eth-abi
    eth-keyfile
    eth-keys
    eth-rlp
    eth-utils
    hexbytes
    pydantic
    rlp
    websockets
  ];

  pythonImportsCheck = [ "eth_account" ];

  pythonRelaxDeps = [ "eth-keyfile" ];

  meta = {
    description = "Account abstraction library for web3.py";
    homepage = "https://github.com/ethereum/eth-account";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
