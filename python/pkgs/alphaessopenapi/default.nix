{
  buildPythonPackage,
  fetchFromGitHub,
  lib,
  setuptools,
  aiohttp,
  voluptuous,
}:
buildPythonPackage rec {
  pname = "alphaessopenapi";
  version = "0.016";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "CharlesGillanders";
    repo = "alphaess-openAPI";
    tag = version;
    hash = "sha256-kmKC3NWxu4Auphsc2RFkHVbJVFGrEpT7SeLk4bHl8N0=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aiohttp
    voluptuous
  ];

  pythonImportsCheck = [
    "alphaess"
  ];

  meta = {
    homepage = "https://github.com/CharlesGillanders/alphaess-openAPI";
    description = "Library that uses the Alpha ESS Open API to retrieve data on your Alpha ESS inverter, photovoltaic panels, and battery";
    license = lib.licenses.mit;
  };
}
