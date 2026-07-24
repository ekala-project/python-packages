{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pox";
  version = "0.3.7";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-BlL28hA/5tS6Y4vrb6jT6KaP1EvLYzFcYUEYUVvMOvs=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pox" ];

  meta = {
    description = "Utilities for filesystem exploration and automated builds";
    homepage = "https://pox.readthedocs.io/";
    license = lib.licenses.bsd3;
  };
}
