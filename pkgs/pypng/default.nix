{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pypng";
  version = "0.20220715.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-c5xDO6lvB4MV3lTA25da7lN8vD4dCuTtmqsMoeQn4sE=";
  };

  nativeBuildInputs = [ setuptools ];

  pythonImportsCheck = [ "png" ];

  meta = {
    homepage = "https://gitlab.com/drj11/pypng";
    description = "Pure Python library for PNG image encoding/decoding";
    license = lib.licenses.mit;
  };
}
