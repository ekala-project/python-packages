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
  version = "3.2.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ewDHP4Zw811O2wKT3NgbmAUovucv1mKxgqq6J65XC5M=";
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
