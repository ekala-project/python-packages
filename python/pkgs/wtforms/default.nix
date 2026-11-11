{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  babel,
  hatchling,
  setuptools,

  # dependencies
  markupsafe,
}:

buildPythonPackage (finalAttrs: {
  pname = "wtforms";
  version = "3.3.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-SbtR0Qt4MtSX51hzbaTVb30SmgFdskdW828omS8XVAQ=";
  };

  build-system = [
    babel
    hatchling
    setuptools
  ];

  dependencies = [ markupsafe ];

  pythonImportsCheck = [ "wtforms" ];

  meta = {
    description = "Flexible forms validation and rendering library for Python";
    homepage = "https://github.com/wtforms/wtforms";
    license = lib.licenses.bsd3;
  };
})
