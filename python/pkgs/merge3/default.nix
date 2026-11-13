{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "merge3";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-SoJRBozbLBq6dtMa5q/15qR8eaHuEHHVpY83vwnyp5A=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "merge3" ];

  meta = {
    homepage = "https://github.com/breezy-team/merge3";
    description = "Python implementation of 3-way merge";
    license = lib.licenses.gpl2Plus;
  };
})
