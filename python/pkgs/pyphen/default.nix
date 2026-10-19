{
  lib,
  fetchPypi,
  buildPythonPackage,
  flit-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyphen";
  version = "0.18.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-265vu+TwHLIGEItDVz2FfGcQe+nQ446xsI1voiEGNKc=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "pyphen" ];

  meta = {
    description = "Module to hyphenate text";
    homepage = "https://github.com/Kozea/Pyphen";
    license = lib.licenses.lgpl21;
  };
})
