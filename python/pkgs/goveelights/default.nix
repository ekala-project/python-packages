{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "goveelights";
  version = "0.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-A7tfY+aFzhfruCZ43usj1/CsTejbPMzHM8SYrY/TU1s=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  # Module has no tests

  pythonImportsCheck = [ "goveelights" ];

  meta = {
    description = "Python module for interacting with the Govee API";
    homepage = "https://github.com/arcanearronax/govee_lights";
    license = lib.licenses.mit;
  };
})
