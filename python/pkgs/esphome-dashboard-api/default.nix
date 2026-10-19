{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  aiohttp,
  orjson,
}:

buildPythonPackage (finalAttrs: {
  pname = "esphome-dashboard-api";
  version = "1.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "esphome";
    repo = "dashboard-api";
    tag = finalAttrs.version;
    hash = "sha256-3VVdWHGpLSgyQkp3b0wVao5lW/3peWES2cE8P5KBM5Q=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aiohttp
    orjson
  ];

  pythonImportsCheck = [ "esphome_dashboard_api" ];

  meta = {
    description = "API to interact with ESPHome Dashboard";
    homepage = "https://github.com/esphome/dashboard-api";
    license = lib.licenses.mit;
  };
})
