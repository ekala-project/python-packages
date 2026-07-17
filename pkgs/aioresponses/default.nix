{
  lib,
  fetchPypi,
  buildPythonPackage,
  pbr,
  setuptools,
  aiohttp,
}:

buildPythonPackage rec {
  pname = "aioresponses";
  version = "0.7.8";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-uGHN/l3FjzuK+sewppc9XXsstgjdD2JT0WuO6Or23xE=";
  };

  nativeBuildInputs = [
    pbr
    setuptools
  ];

  dependencies = [ aiohttp ];

  pythonImportsCheck = [ "aioresponses" ];

  doCheck = false;

  meta = {
    homepage = "https://github.com/pnuckowski/aioresponses";
    description = "Helper to mock/fake web requests in python aiohttp package";
    license = lib.licenses.mit;
  };
}
