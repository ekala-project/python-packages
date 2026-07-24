{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "colour";
  version = "0.1.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ryASD+/Sr+3osAH77y6p2nCtfUn6/bZIkCXa6HRcOu4=";
  };

  patches = [ ./remove-unmaintained-d2to1.diff ];

  build-system = [ setuptools ];

  pythonImportsCheck = [ "colour" ];

  meta = {
    homepage = "https://github.com/vaab/colour";
    description = "Converts and manipulates common color representation (RGB, HSV, web, ...)";
    license = lib.licenses.bsd2;
  };
}
