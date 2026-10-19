{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  httpx,
  poetry-core,
  pytest-asyncio,
  pytest-httpx,
  pytestCheckHook,
  yarl,
}:

buildPythonPackage (finalAttrs: {
  pname = "elmax";
  version = "0.1.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "home-assistant-ecosystem";
    repo = "python-elmax";
    tag = finalAttrs.version;
    hash = "sha256-EcYEpYv+EwwEfW8Sy7aQjFAPpmsA6qVbmlwrPdxdnEw=";
  };

  nativeBuildInputs = [ poetry-core ];

  dependencies = [
    httpx
    yarl
  ];

  nativeCheckInputs = [
    pytest-asyncio
    pytest-httpx
    pytestCheckHook
  ];

  pythonImportsCheck = [ "elmax" ];

  meta = {
    description = "Python API client for the Elmax Cloud services";
    mainProgram = "poetry-template";
    homepage = "https://github.com/home-assistant-ecosystem/python-elmax";
    license = lib.licenses.asl20;
  };
})
