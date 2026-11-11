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

buildPythonPackage (finalAttrs: {
  pname = "pymongo";
  version = "4.19.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) version;
    pname = "pymongo";
    hash = "sha256-PFEN08XZs5LTszu10qWUdYrP6PAm/KZUJT+UfOCvnUA=";
  };

  build-system = [
    hatch-requirements-txt
    hatchling
    setuptools
  ];

  dependencies = [ dnspython ];

  # Tests call a running mongodb instance

  pythonImportsCheck = [ "pymongo" ];

  meta = {
    description = "Python driver for MongoDB";
    homepage = "https://github.com/mongodb/mongo-python-driver";
    license = lib.licenses.asl20;
  };
})
