{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  six,
}:

buildPythonPackage rec {
  pname = "robot-detection";
  version = "0.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-PY+3LKRxZLjOVeM73ak3QvYsNI3vfTzDtCsM60eVovU=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "robot_detection" ];

  meta = {
    description = "Library for detecting if a HTTP User Agent header is likely to be a bot";
    homepage = "https://github.com/rory/robot-detection";
    license = lib.licenses.gpl3Plus;
  };
}
