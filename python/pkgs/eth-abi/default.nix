{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  # dependencies
  eth-typing,
  eth-utils,
  parsimonious,
}:

buildPythonPackage rec {
  pname = "eth-abi";
  version = "5.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "eth-abi";
    tag = "v${version}";
    hash = "sha256-/tyGm/lH72oZEKfTd25t+k0y3TuAZQg+hUABT4YCP2g=";
  };

  build-system = [ setuptools ];

  dependencies = [
    eth-typing
    eth-utils
    parsimonious
  ];

  pythonRelaxDeps = [ "parsimonious" ];
  pythonImportsCheck = [ "eth_abi" ];

  meta = {
    description = "Ethereum ABI utilities";
    homepage = "https://github.com/ethereum/eth-abi";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
