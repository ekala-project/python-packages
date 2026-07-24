{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "langdetect";
  version = "1.0.9";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-y8H++J+NBic5d0vVHto9oydABrNmHRmcJlX2s/bWBaA=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "langdetect" ];

  meta = {
    description = "Python port of Google's language-detection library";
    homepage = "https://github.com/Mimino666/langdetect";
    license = lib.licenses.asl20;
  };
}
