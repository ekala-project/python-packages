{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  isPyPy,
  # optional dependencies
  pycryptodome,
}:

buildPythonPackage rec {
  pname = "eth-hash";
  version = "0.7.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "eth-hash";
    tag = "v${version}";
    hash = "sha256-91jWZDqrd7ZZlM0D/3sDokJ26NiAQ3gdeBebTV1Lq8s=";
  };

  build-system = [ setuptools ];

  optional-dependencies = {
    pycryptodome = [ pycryptodome ];
  };

  __structuredAttrs = true;

  pythonImportsCheck = [ "eth_hash" ];

  meta = {
    description = "Ethereum hashing function keccak256";
    homepage = "https://github.com/ethereum/eth-hash";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
