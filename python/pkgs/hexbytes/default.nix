{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  eth-utils,
  hypothesis,
  pydantic,
}:

buildPythonPackage rec {
  pname = "hexbytes";
  version = "2.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "hexbytes";
    tag = "v${version}";
    hash = "sha256-R0Ucrq/E+g5IaiGTNllslwQOQxgNcSGLcyt6+t14uPM=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];
  pythonImportsCheck = [ "hexbytes" ];

  meta = {
    description = "`bytes` subclass that decodes hex, with a readable console output";
    homepage = "https://github.com/ethereum/hexbytes";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
