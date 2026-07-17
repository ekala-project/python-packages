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
  version = "3.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-3z5rcPMZLpJiMSgSPsjcowZ9+c+t1D1ZaB4hDPuNRoI=";
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
