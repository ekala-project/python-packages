{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,
  isPyPy,

  # dependencies
  eth-hash,
  eth-typing,
  cytoolz,
  toolz,
}:

buildPythonPackage (finalAttrs: {
  pname = "eth-utils";
  version = "6.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "eth-utils";
    tag = "v${finalAttrs.version}";
    hash = "sha256-U1RSKaLw/gDg4lMjkTwR/Wfb5wqQctML9CDZBILMBys=";
  };

  build-system = [ setuptools ];

  dependencies = [
    eth-hash
    eth-typing
  ]
  ++ lib.optional (!isPyPy) cytoolz
  ++ lib.optional isPyPy toolz;

  pythonImportsCheck = [ "eth_utils" ];

  meta = {
    description = "Common utility functions for codebases which interact with ethereum";
    homepage = "https://github.com/ethereum/eth-utils";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
