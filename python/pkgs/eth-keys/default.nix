{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
  # dependencies
  eth-typing,
  eth-utils,
  # nativeCheckInputs
  coincurve,
  isPyPy,
}:

buildPythonPackage rec {
  pname = "eth-keys";
  version = "0.7.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "eth-keys";
    tag = "v${version}";
    hash = "sha256-H/s/D4f4tqP/WTil9uLmFw2Do9sEjMWwEreQEooeszQ=";
  };

  build-system = [ setuptools ];

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
    maintainers = [ ];
  };
}
