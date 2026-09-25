{
  lib,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  buildPythonPackage,
  eth-utils,
}:

buildPythonPackage rec {
  pname = "rlp";
  version = "5.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "pyrlp";
    rev = "v${version}";
    hash = "sha256-a13KBXZyId83EukBTc3zu1GgllsqMRS0gpYfZ29+bjQ=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  propagatedBuildInputs = [ eth-utils ];
  pythonImportsCheck = [ "rlp" ];
  meta = {
    description = "RLP serialization library";
    homepage = "https://github.com/ethereum/pyrlp";
    license = lib.licenses.mit;
  };
}
