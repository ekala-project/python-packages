{
  lib,
  buildPythonPackage,
  cryptography,
  fetchFromGitHub,
  httpx,
  pytest-aiohttp,
  pytest-mock,
  pytestCheckHook,
  respx,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "ha-philipsjs";
  version = "3.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "danielperna84";
    repo = "ha-philipsjs";
    tag = finalAttrs.version;
    hash = "sha256-UWjpcK0PO+ASRd8ivHSMI2LopFHmc5tLD8sKBul2Nps=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cryptography
    httpx
  ];

  nativeCheckInputs = [
    pytest-aiohttp
    pytest-mock
    pytestCheckHook
    respx
  ];

  pythonImportsCheck = [ "haphilipsjs" ];

  meta = {
    description = "Library to interact with Philips TVs with jointSPACE API";
    homepage = "https://github.com/danielperna84/ha-philipsjs";
    license = lib.licenses.mit;
  };
})
