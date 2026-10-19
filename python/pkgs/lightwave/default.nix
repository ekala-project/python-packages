{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "lightwave";
  version = "0.24";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-l9hwdAKrpdXj/pkrgyiuhbPaGgT6tjfoOw/TBpR+k1I=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "lightwave" ];

  # Requires physical hardware

  meta = {
    description = "Module for interacting with LightwaveRF hubs";
    homepage = "https://github.com/GeoffAtHome/lightwave";
    license = lib.licenses.mit;
  };
})
