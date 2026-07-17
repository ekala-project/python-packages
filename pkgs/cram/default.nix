{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "cram";
  version = "0.7";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-fadEWvLOFbkKrV7EeS+FfO9XhtcfFDd+nrmU2Lgzfy8=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "cram" ];

  meta = {
    description = "Simple testing framework for command line applications";
    homepage = "https://bitheap.org/cram/";
    license = lib.licenses.gpl2Plus;
  };
}
