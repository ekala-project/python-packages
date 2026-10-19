{
  lib,
  fetchPypi,
  # build-system
  setuptools,
  buildPythonPackage,
  aiolifx,
}:

buildPythonPackage rec {
  pname = "aiolifx-effects";
  version = "0.3.2";
  pyproject = true;

  src = fetchPypi {
    inherit version;
    pname = "aiolifx_effects";
    hash = "sha256-Mhxs5PNr2W9ych56WYUZTEGck4HVTQfkil3S3zHv6Qc=";
  };

  build-system = [ setuptools ];

  dependencies = [ aiolifx ];

  # tests are not implemented

  pythonImportsCheck = [ "aiolifx_effects" ];

  meta = {
    description = "Light effects (pulse, colorloop ...) for LIFX lights running on aiolifx";
    homepage = "https://github.com/amelchio/aiolifx_effects";
    license = lib.licenses.mit;
  };
}
