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
  pname = "leather";
  version = "0.4.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ZxGcKu6TvoIfB3GTvYU04pbAWzi9F02cWoDEqjHRpNM=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "leather" ];

  meta = {
    homepage = "http://leather.rtfd.io";
    description = "Python charting library";
    license = lib.licenses.mit;
  };
}
