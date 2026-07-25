{
  lib,
  fetchFromGitHub,
  setuptools,
  buildPythonPackage,
  eth-utils,
}:

buildPythonPackage rec {
  pname = "rlp";
  version = "4.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "pyrlp";
    rev = "v${version}";
    hash = "sha256-moerdcAJXqhlzDnTlvxL3Nzz485tOzJVCPlGrof80eQ=";
  };

  build-system = [ setuptools ];

  propagatedBuildInputs = [ eth-utils ];
  pythonImportsCheck = [ "rlp" ];
  meta = {
    description = "RLP serialization library";
    homepage = "https://github.com/ethereum/pyrlp";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
