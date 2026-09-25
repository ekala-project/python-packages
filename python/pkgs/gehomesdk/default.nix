{
  lib,
  aiohttp,
  beautifulsoup4,
  bidict,
  buildPythonPackage,
  cryptography,
  fetchPypi,
  humanize,
  pytestCheckHook,
  requests,
  setuptools,
  websockets,
}:

buildPythonPackage (finalAttrs: {
  pname = "gehomesdk";
  version = "2026.8.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-4WGkodI608LmlHpzYfPIrexZBNAsImmj2B55+WJgq2E=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aiohttp
    beautifulsoup4
    bidict
    humanize
    requests
    websockets
  ];

  nativeCheckInputs = [
    pytestCheckHook
    cryptography
  ];

  pythonImportsCheck = [ "gehomesdk" ];

  meta = {
    description = "Python SDK for GE smart appliances";
    homepage = "https://github.com/simbaja/gehome";
    license = lib.licenses.mit;
    mainProgram = "gehome-appliance-data";
  };
})
