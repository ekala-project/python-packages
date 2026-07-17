{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "mistletoe";
  version = "1.5.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-xVcc5sqc/cfOkVHDrnmstBjgZ4EgAJB2FkJxl2SAMKM=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "mistletoe" ];

  meta = {
    description = "Fast and extensible Markdown parser";
    homepage = "https://github.com/miyuchina/mistletoe";
    license = lib.licenses.mit;
  };
}
