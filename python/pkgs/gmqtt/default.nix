{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # tests
  pytestCheckHook,
  pytest-asyncio,
}:

buildPythonPackage (finalAttrs: {
  pname = "gmqtt";
  version = "0.9.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-lwkZopBYoS2z8hipte6BEk4CqSiC1pa6nYUHjnTh9yo=";
  };

  build-system = [ setuptools ];

  # Tests require local socket connection which is forbidden in the sandbox

  nativeCheckInputs = [
    pytestCheckHook
    pytest-asyncio
  ];
  pythonImportsCheck = [ "gmqtt" ];

  meta = {
    description = "Python MQTT v5.0 async client";
    homepage = "https://github.com/wialon/gmqtt";
    license = lib.licenses.mit;
  };
})
