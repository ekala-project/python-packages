{
  aiohttp,
  aioresponses,
  buildPythonPackage,
  fetchFromGitHub,
  lib,
  poetry-core,
  pytest-asyncio,
  pytestCheckHook,
  zeroconf,
}:

buildPythonPackage rec {
  pname = "altruistclient";
  version = "0.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "LoSk-p";
    repo = "altruistclient";
    tag = version;
    hash = "sha256-36qqB9e53eZgMgwXzrXlMOySnuqmT3vLiU02NL9xtko=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    aiohttp
    zeroconf
  ];

  pythonImportsCheck = [ "altruistclient" ];

  nativeCheckInputs = [
    aioresponses
    pytest-asyncio
    pytestCheckHook
  ];

  meta = {
    description = "Async library for discovering and fetching data from Altruist sensors";
    homepage = "https://github.com/LoSk-p/altruistclient";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
