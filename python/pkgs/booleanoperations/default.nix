{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
  fonttools,
  pyclipper,
}:

buildPythonPackage rec {
  pname = "booleanoperations";
  version = "0.10.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-bXGfVg0qHdZ2yBK4ROzOtpPJZ5HHZXkImrfQ9dtc7b4=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    fonttools
    pyclipper
  ];

  pythonImportsCheck = [ "booleanOperations" ];

  meta = {
    description = "Boolean operations on paths";
    homepage = "https://github.com/typemytype/booleanOperations";
    license = lib.licenses.mit;
  };
}
