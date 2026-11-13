{
  aiohttp,
  aiohttp-sse-client,
  aioresponses,
  buildPythonPackage,
  fetchPypi,
  lib,
  poetry-core,
  pytest-asyncio,
  pytestCheckHook,
  yarl,
}:

buildPythonPackage (finalAttrs: {
  pname = "iometer";
  version = "1.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-Go3C3Nmo9vVATZmdWM9GPG0PbfqHHhB9fUel38UgD98=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    aiohttp
    aiohttp-sse-client
    yarl
  ];

  pythonImportsCheck = [ "iometer" ];

  nativeCheckInputs = [
    aioresponses
    pytest-asyncio
    pytestCheckHook
  ];

  enabledTestPaths = [
    "tests/test.py"
  ];

  meta = {
    description = "Python client for interacting with IOmeter devices over HTTP";
    homepage = "https://github.com/iometer-gmbh/iometer.py";
    license = lib.licenses.mit;
  };
})
