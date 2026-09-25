{
  aiohttp,
  buildPythonPackage,
  fetchFromGitHub,
  lib,
  pytest-asyncio,
  pytestCheckHook,
  requests,
  setuptools,
  ujson,
}:

buildPythonPackage rec {
  pname = "ayla-iot-unofficial";
  version = "1.5.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "rewardone";
    repo = "ayla-iot-unofficial";
    tag = "v${version}";
    hash = "sha256-reKXctSmGk1H3kEnvcC7AiDWLwr2fdezZqM5HI2qdYU=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aiohttp
    requests
    ujson
  ];

  pythonImportsCheck = [ "ayla_iot_unofficial" ];

  nativeCheckInputs = [
    pytest-asyncio
    pytestCheckHook
  ];

  enabledTestPaths = [ "tests/ayla_iot_unofficial.py" ];

  # tests interact with the actual API
  doCheck = false;

  meta = {
    description = "Unofficial python library for interacting with the Ayla IoT API";
    homepage = "https://github.com/rewardone/ayla-iot-unofficial";
    license = lib.licenses.mit;
  };
}
