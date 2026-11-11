{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  httpx2,
  requests,
  pytestCheckHook,
  responses,
}:

buildPythonPackage (finalAttrs: {
  pname = "herepy";
  version = "3.7.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "abdullahselek";
    repo = "HerePy";
    tag = finalAttrs.version;
    hash = "sha256-I8ayZA+5mdZlmNH0VopEXJGslP5OXuXC4STFE9D7stg=";
  };

  build-system = [ hatchling ];

  pythonRelaxDeps = [ "httpx2" ];

  dependencies = [
    httpx2
    requests
  ];

  nativeCheckInputs = [
    pytestCheckHook
    responses
  ];

  pythonImportsCheck = [ "herepy" ];

  meta = {
    description = "Library that provides a Python interface to the HERE APIs";
    homepage = "https://github.com/abdullahselek/HerePy";
    license = lib.licenses.mit;
  };
})
