{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "namex";
  version = "0.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-EX8DzNMCzEjj9cWKKWg49ricg0VauGg6HoXypDCqQwY=";
  };

  build-system = [ setuptools ];

  # No tests
  doCheck = false;

  pythonImportsCheck = [ "namex" ];

  meta = {
    description = "Simple utility to separate the implementation of your Python package and its public API surface";
    homepage = "https://github.com/fchollet/namex";
    license = lib.licenses.asl20;
  };
}
