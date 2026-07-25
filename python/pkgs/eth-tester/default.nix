{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  eth-abi,
  eth-account,
  eth-keys,
  eth-utils,
  pydantic,
  rlp,
  semantic-version,
}:

buildPythonPackage rec {
  pname = "eth-tester";
  version = "0.13.0-beta.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ethereum";
    repo = "eth-tester";
    tag = "v${version}";
    hash = "sha256-ssPtsEQAyaJde/empEpGU1bf3s4yxwlEXqpacN5GWDw=";
  };

  build-system = [ setuptools ];

  dependencies = [
    eth-abi
    eth-account
    eth-keys
    eth-utils
    pydantic
    rlp
    semantic-version
  ];

  pythonImportsCheck = [ "eth_tester" ];

  meta = {
    description = "Tool suite for testing ethereum applications";
    homepage = "https://github.com/ethereum/eth-tester";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
