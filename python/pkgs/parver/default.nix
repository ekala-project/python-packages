{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  attrs,
  arpeggio,
}:

buildPythonPackage (finalAttrs: {
  pname = "parver";
  version = "1.0.1.post0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-G/ucPxPV2syqEOtgVnm129S/LhW09fob3xeMXD8GWiw=";
  };

  build-system = [ hatchling ];

  dependencies = [
    attrs
    arpeggio
  ];

  pythonImportsCheck = [ "parver" ];

  meta = {
    description = "Allows parsing and manipulation of PEP 440 version numbers";
    homepage = "https://github.com/RazerM/parver";
    license = lib.licenses.mit;
  };
})
