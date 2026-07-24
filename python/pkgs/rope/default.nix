{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "rope";
  version = "1.14.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-iAPjtmcxUET2JwsMaaEMBnn58yLtjv5iRak863ZY2mk=";
  };

  build-system = [ setuptools ];

  pythonRemoveDeps = [ "pytoolconfig" ];

  pythonImportsCheck = [ "rope" ];

  meta = {
    description = "Python refactoring library";
    homepage = "https://github.com/python-rope/rope";
    license = lib.licenses.gpl3Plus;
  };
}
