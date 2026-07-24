{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  # dependencies
  typing-extensions,
  # nativeCheckInputs
  pytest-xdist,
}:

buildPythonPackage rec {
  pname = "eth-typing";
  version = "6.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "eth-typing";
    tag = "v${version}";
    hash = "sha256-bdZrrglsJGNsqD6ShsqPO6ljViZr9Ms9A8Km45pnEYA=";
  };

  build-system = [ setuptools ];

  dependencies = [ typing-extensions ];
  pythonImportsCheck = [ "eth_typing" ];
  meta = {
    description = "Common type annotations for Ethereum Python packages";
    homepage = "https://github.com/ethereum/eth-typing";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
