{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  hatch-vcs,
}:

buildPythonPackage rec {
  pname = "pint";
  version = "0.25.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-+PXfbPZTFNdNoa3hv5b44+TQxBtRV3rFPEnn1EylrO4=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  pythonRemoveDeps = [
    "flexcache"
    "flexparser"
    "platformdirs"
  ];

  # pint requires flexcache/flexparser at import time
  # pythonImportsCheck = [ "pint" ];

  meta = {
    description = "Physical quantities module";
    homepage = "https://github.com/hgrecco/pint/";
    license = lib.licenses.bsd3;
  };
}
