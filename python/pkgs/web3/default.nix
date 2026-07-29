{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  aiohttp,
  eth-abi,
  eth-account,
  eth-hash,
  eth-typing,
  eth-utils,
  hexbytes,
  jsonschema,
  lru-dict,
  protobuf,
  pydantic,
  requests,
  types-requests,
  websockets,
}:

buildPythonPackage rec {
  pname = "web3";
  version = "7.15.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "web3.py";
    tag = "v${version}";
    hash = "sha256-BStkLH7lCnhVs2Fc3c0EBXzyZtEgI8ywA01OEBYLUeQ=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "websockets"
  ];

  dependencies = [
    aiohttp
    eth-abi
    eth-account
    eth-hash
  ]
  ++ eth-hash.optional-dependencies.pycryptodome
  ++ [
    eth-typing
    eth-utils
    hexbytes
    jsonschema
    lru-dict
    protobuf
    pydantic
    requests
    types-requests
    websockets
  ];

  pythonImportsCheck = [ "web3" ];

  meta = {
    description = "Python interface for interacting with the Ethereum blockchain and ecosystem";
    homepage = "https://web3py.readthedocs.io/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
