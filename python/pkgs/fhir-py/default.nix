{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  typing-extensions,
  aiohttp,
  pytz,
  requests,
  pytestCheckHook,
  pytest-asyncio,
  pytest-cov-stub,
  pydantic,
  responses,
}:

buildPythonPackage rec {
  pname = "fhir-py";
  version = "2.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "beda-software";
    repo = "fhir-py";
    tag = "v${version}";
    hash = "sha256-XPkWtzYtMPCcV7FbV89Qv/kfV7qu3ZT3XwcLDoJ392o=";
  };

  build-system = [ flit-core ];

  dependencies = [
    aiohttp
    pytz
    requests
    typing-extensions
  ];

  nativeCheckInputs = [
    pytestCheckHook
    pytest-asyncio
    pytest-cov-stub
    pydantic
    responses
  ];

  # sync/async test cases require docker-compose to set up services, so disable:
  disabledTestPaths = [ "tests/test_lib_sync.py" ];
  disabledTests = [ "TestLibAsyncCase" ];

  pythonImportsCheck = [ "fhirpy" ];

  meta = {
    description = "Async/sync API for FHIR resources";
    homepage = "https://github.com/beda-software/fhir-py";
    license = lib.licenses.mit;
  };
}
