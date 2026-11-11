{
  lib,
  buildPythonPackage,
  fetchPypi,
  pdm-backend,
  uritemplate,
  pyjwt,
  typing-extensions,
  pytestCheckHook,
  aiohttp,
  httpx,
  importlib-resources,
  pytest-asyncio,
  pytest-tornasync,
}:

buildPythonPackage (finalAttrs: {
  pname = "gidgethub";
  version = "6.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-Tm74rNtFVxIi6m9+yQ7IypPfhHOR2qyVAlYngPGYg2k=";
  };

  build-system = [ pdm-backend ];

  dependencies = [
    uritemplate
    pyjwt
    typing-extensions
  ]
  ++ pyjwt.optional-dependencies.crypto;

  nativeCheckInputs = [
    pytestCheckHook
    aiohttp
    httpx
    importlib-resources
    pytest-asyncio
    pytest-tornasync
  ];

  disabledTests = [
    # Require internet connection
    "test__request"
    "test_get"
  ];

  meta = {
    description = "Async GitHub API library";
    homepage = "https://github.com/brettcannon/gidgethub";
    license = lib.licenses.asl20;
  };
})
