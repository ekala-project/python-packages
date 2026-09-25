{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
  # dependencies
  eth-typing,
  eth-utils,
  # nativeCheckInputs
  coincurve,
  isPyPy,
}:

buildPythonPackage rec {
  pname = "eth-keys";
  version = "0.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "eth-keys";
    tag = "v${version}";
    hash = "sha256-mREmzckOddTUB6E/UIMNP+u520hDxAqLNQdbxqoisfI=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    eth-typing
    eth-utils
  ];
  optional-dependencies = {
    coincurve = [ coincurve ];
  };

  meta = {
    description = "Common API for Ethereum key operations";
    homepage = "https://github.com/ethereum/eth-keys";
    license = lib.licenses.mit;
  };
}
