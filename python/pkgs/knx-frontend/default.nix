{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "knx-frontend";
  version = "2026.9.29.213422";
  pyproject = true;

  # TODO: source build, uses yarn.lock
  src = fetchPypi {
    pname = "knx_frontend";
    inherit (finalAttrs) version;
    hash = "sha256-BlHcIvAA4DIxITAOGTnFOi/OfiE/ZTuMZ6x9eS7RLow=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "knx_frontend" ];

  # no tests

  meta = {
    description = "Home Assistant Panel for managing the KNX integration";
    homepage = "https://github.com/XKNX/knx-frontend";
    license = lib.licenses.mit;
  };
})
