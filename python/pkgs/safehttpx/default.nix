{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatchling,

  # dependencies
  httpx2,
}:

buildPythonPackage (finalAttrs: {
  pname = "safehttpx";
  version = "0.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-vWmKWhcwd3BAzP2sCu96e9sQ9ZkxeWxMmcAD3JDf8oE=";
  };

  build-system = [ hatchling ];

  dependencies = [ httpx2 ];

  pythonImportsCheck = [ "safehttpx" ];

  meta = {
    description = "SSRF-safe wrapper around httpx";
    homepage = "https://github.com/gradio-app/safehttpx";
    license = lib.licenses.asl20;
  };
})
