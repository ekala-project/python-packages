{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  eth-hash,
}:

buildPythonPackage rec {
  pname = "eth-bloom";
  version = "4.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "eth-bloom";
    tag = "v${version}";
    hash = "sha256-zz0os8+Du5nFSQqOIS42X1h3j4MGgLsRUvvjVTTfKG4=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ eth-hash ];

  pythonImportsCheck = [ "eth_bloom" ];

  meta = {
    description = "Implementation of the Ethereum bloom filter";
    homepage = "https://github.com/ethereum/eth-bloom";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
