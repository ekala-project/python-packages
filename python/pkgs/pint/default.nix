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
  version = "0.26.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-OR5dL8Af2xIcETuOtHOGaIV1VCwfUUTEZf8xi/UTNXM=";
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
