{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "manhole";
  version = "1.8.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Nmj9r4OzPJQ9tOdQ4MVU4xwg9jM4SWiV3U1kEGgNnEs=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "manhole" ];

  meta = {
    description = "Debugging manhole for Python applications";
    homepage = "https://github.com/ionelmc/python-manhole";
    license = lib.licenses.bsd2;
  };
}
