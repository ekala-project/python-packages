{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  hatch-vcs,
  flexcache,
  flexparser,
  platformdirs,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "pint";
  version = "0.25.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-+PXfbPZTFNdNoa3hv5b44+TQxBtRV3rFPEnn1EylrO4=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    flexcache
    flexparser
    platformdirs
    typing-extensions
  ];

  pythonImportsCheck = [ "pint" ];

  meta = {
    description = "Physical quantities module";
    homepage = "https://github.com/hgrecco/pint/";
    license = lib.licenses.bsd3;
  };
})
