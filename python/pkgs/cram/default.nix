{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "cram";
  version = "0.7";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-fadEWvLOFbkKrV7EeS+FfO9XhtcfFDd+nrmU2Lgzfy8=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "cram" ];

  meta = {
    description = "Simple testing framework for command line applications";
    homepage = "https://bitheap.org/cram/";
    license = lib.licenses.gpl2Plus;
  };
})
