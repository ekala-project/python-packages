{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  scipy,
}:

buildPythonPackage rec {
  pname = "iapws";
  version = "1.5.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-yG4eFxVRh3/pzrA+5BXkpJBtLlJpj/nVZWeEYJc5300=";
  };

  build-system = [ setuptools ];

  dependencies = [ scipy ];

  meta = {
    description = "Python implementation of standard from IAPWS";
    homepage = "https://github.com/jjgomera/iapws";
    license = lib.licenses.gpl3;
  };
}
