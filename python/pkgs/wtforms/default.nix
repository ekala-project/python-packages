{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  babel,
  hatchling,
  setuptools,

  # dependencies
  markupsafe,
}:

buildPythonPackage rec {
  pname = "wtforms";
  version = "3.3.0b3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-oRxWo1Xbp0OzRUFL8kkPw/5xUCatkNxZGBLasYXZQ30=";
  };

  build-system = [
    babel
    hatchling
    setuptools
  ];

  dependencies = [ markupsafe ];

  doCheck = false;

  pythonImportsCheck = [ "wtforms" ];

  meta = {
    description = "Flexible forms validation and rendering library for Python";
    homepage = "https://github.com/wtforms/wtforms";
    license = lib.licenses.bsd3;
  };
}
