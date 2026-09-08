{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatch-requirements-txt,
  hatchling,
  setuptools,

  # dependencies
  dnspython,
}:

buildPythonPackage rec {
  pname = "pymongo";
  version = "4.18.0";
  pyproject = true;

  src = fetchPypi {
    inherit version;
    pname = "pymongo";
    hash = "sha256-bzPNIDPo6iFtMGm16+p53tdO8qk/aak7Js8xAIL5tbk=";
  };

  build-system = [
    hatch-requirements-txt
    hatchling
    setuptools
  ];

  dependencies = [ dnspython ];

  # Tests call a running mongodb instance
  doCheck = false;

  pythonImportsCheck = [ "pymongo" ];

  meta = {
    description = "Python driver for MongoDB";
    homepage = "https://github.com/mongodb/mongo-python-driver";
    license = lib.licenses.asl20;
  };
}
