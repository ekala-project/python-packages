{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  eth-utils,
  hexbytes,
  rlp,
}:

buildPythonPackage rec {
  pname = "eth-rlp";
  version = "2.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "eth-rlp";
    rev = "v${version}";
    hash = "sha256-e8nPfxk3OnFEcPnfTy1IEUCHVId6E/ssNOUeAe331+U=";
  };

  build-system = [ setuptools ];

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
    maintainers = [ ];
  };
}
