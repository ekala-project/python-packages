{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  requests,
  pyjwt,
  mock,
  python-dateutil,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "messagebird";
  version = "2.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "messagebird";
    repo = "python-rest-api";
    tag = finalAttrs.version;
    hash = "sha256-OiLhnmZ725VbyoOHvSf4nKQRA7JsxqcOv0VKBL6rUtU=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pyjwt
    python-dateutil
    requests
  ];

  nativeCheckInputs = [
    mock
    pytestCheckHook
  ];

  pythonImportsCheck = [ "messagebird" ];

  disabledTestPaths = [
    # ValueError: not enough values to unpack (expected 6, got 0)
    "tests/test_request_validator.py"
  ];

  meta = {
    description = "Client for MessageBird's REST API";
    homepage = "https://github.com/messagebird/python-rest-api";
    license = lib.licenses.bsd2;
  };
})
