{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "simplekml";
  version = "1.3.6";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-zaaHvidUOV/KtmTpCOv1ifrNQehDbSM9K+N6ae+xxTY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "simplekml" ];

  meta = {
    description = "Python package to generate KML";
    homepage = "https://simplekml.readthedocs.io/";
    license = lib.licenses.lgpl3Plus;
  };
})
