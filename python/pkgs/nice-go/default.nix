{
  buildPythonPackage,
  fetchFromGitHub,
  aiobotocore,
  aiohttp,
  lib,
  poetry-core,
  pycognito,
  pytest-aiohttp,
  pytest-asyncio,
  pytest-cov-stub,
  pytestCheckHook,
  syrupy,
  tenacity,
  yarl,
}:

buildPythonPackage rec {
  pname = "nice-go";
  version = "1.0.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "IceBotYT";
    repo = "nice-go";
    tag = version;
    hash = "sha256-KrsAs5aMkrhxv6PtFTm+8e0h2hAD/bc4ADam2jT2oAc=";
  };

  build-system = [ poetry-core ];

  pythonRelaxDeps = [
    "aiobotocore"
    "tenacity"
  ];

  dependencies = [
    aiobotocore
    aiohttp
    pycognito
    tenacity
    yarl
  ];

  # Import check disabled: aiobotocore 3.9.1 is incompatible with the
  # available botocore (missing _SERVICE_MAX_ATTEMPTS export).
  dontUsePythonImportsCheck = true;

  nativeCheckInputs = [
    pytest-aiohttp
    pytest-asyncio
    pytest-cov-stub
    pytestCheckHook
    syrupy
  ];

  meta = {
    description = "Control various Nice access control products";
    homepage = "https://github.com/IceBotYT/nice-go";
    license = lib.licenses.mit;
  };
}
