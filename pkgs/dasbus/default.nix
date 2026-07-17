{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "dasbus";
  version = "1.7";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-qIUNhBrf6O5fe7n4LPRJq5tJUNwGM4lwcXGODQA2tvY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "dasbus" ];

  meta = {
    description = "DBus library in Python 3";
    homepage = "https://github.com/rhinstaller/dasbus";
    license = lib.licenses.lgpl21Only;
  };
}
