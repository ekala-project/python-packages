{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "termstyle";
  version = "0.1.11";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-73S4NpjqAUESBAzzKxoJPBqz2RxN0Y7MA+wXj9mcn58=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "termstyle" ];

  meta = {
    description = "Console colouring for python";
    homepage = "https://pypi.org/project/python-termstyle/";
    license = lib.licenses.bsdOriginal;
  };
}
