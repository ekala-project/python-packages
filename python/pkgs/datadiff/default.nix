{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "datadiff";
  version = "2.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-fOcN/uqMM/HYjbRrDv/ukFzDa023Ofa7BwqC3omB0ws=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "datadiff" ];
  meta = {
    description = "Library to provide human-readable diffs of Python data structures";
    homepage = "https://sourceforge.net/projects/datadiff/";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
