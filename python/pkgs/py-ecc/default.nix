{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  cached-property,
  eth-typing,
  eth-utils,
}:

buildPythonPackage rec {
  pname = "py-ecc";
  version = "8.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "py_ecc";
    rev = "v${version}";
    hash = "sha256-4nmmX4TuErHxIDrBi+Ppr+4vuE7dSeqf8OqOxtqb3sY=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cached-property
    eth-typing
    eth-utils
  ];

  pythonImportsCheck = [ "py_ecc" ];

  meta = {
    description = "ECC pairing and bn_128 and bls12_381 curve operations";
    homepage = "https://github.com/ethereum/py_ecc";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
