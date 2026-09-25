{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  eth-utils,
  hexbytes,
  rlp,
}:

buildPythonPackage rec {
  pname = "eth-rlp";
  version = "3.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "eth-rlp";
    rev = "v${version}";
    hash = "sha256-0D/1PS4Q4BrypE9QFJBj6jDJNVAVhgqXJeGCk86zYRk=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  propagatedBuildInputs = [
    hexbytes
    eth-utils
    rlp
  ];
  pythonImportsCheck = [ "eth_rlp" ];
  meta = {
    description = "RLP definitions for common Ethereum objects";
    homepage = "https://github.com/ethereum/eth-rlp";
    license = lib.licenses.mit;
  };
}
