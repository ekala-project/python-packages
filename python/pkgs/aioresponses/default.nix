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
  version = "0.7.9";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Hc+iiTj8AG8Eapg4OnwHrBgL56SSwe1Vf1zXsIBTV9M=";
  };

  nativeBuildInputs = [
    pbr
    setuptools
  ];

  dependencies = [ aiohttp ];

  pythonImportsCheck = [ "aioresponses" ];

  meta = {
    homepage = "https://github.com/pnuckowski/aioresponses";
    description = "Helper to mock/fake web requests in python aiohttp package";
    license = lib.licenses.mit;
  };
}
