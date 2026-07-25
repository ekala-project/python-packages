{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  eth-hash,
}:

buildPythonPackage rec {
  pname = "eth-bloom";
  version = "3.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "eth-bloom";
    tag = "v${version}";
    hash = "sha256-WrBLFICPyb+1bIitHZ172A1p1VYqLR75YfJ5/IBqDr8=";
  };

  build-system = [ setuptools ];

  dependencies = [ eth-hash ];

  pythonImportsCheck = [ "eth_bloom" ];

  meta = {
    description = "Implementation of the Ethereum bloom filter";
    homepage = "https://github.com/ethereum/eth-bloom";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
