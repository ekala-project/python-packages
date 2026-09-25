{
  lib,
  aiohttp,
  aioresponses,
  buildPythonPackage,
  fetchFromGitHub,
  pytest-asyncio,
  pytestCheckHook,
  poetry-core,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "incomfort-client";
  version = "0.7.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "zxdavb";
    repo = "incomfort-client";
    tag = "v${finalAttrs.version}";
    hash = "sha256-OxrsRoP3HLHEE2YVLUEXA+VlYNoAJR+1Uph11M/Zv68=";
  };

  build-system = [ poetry-core ];

  dependencies = [ aiohttp ];

  nativeCheckInputs = [
    aioresponses
    pytest-asyncio
    pytestCheckHook
  ];

  pythonImportsCheck = [ "incomfortclient" ];

  meta = {
    description = "Python module to poll Intergas boilers via a Lan2RF gateway";
    homepage = "https://github.com/zxdavb/incomfort-client";
    license = lib.licenses.mit;
  };
})
