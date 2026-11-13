{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "jinxed";
  version = "2.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-fnVbgx+qJEPUT7TOfAIC65w+05vVvxGTNliI9PYJK1Q=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "jinxed" ];

  meta = {
    description = "Jinxed Terminal Library, a pure-Python implementation of terminfo";
    homepage = "https://github.com/Rockhopper-Technologies/jinxed";
    license = lib.licenses.mpl20;
  };
})
