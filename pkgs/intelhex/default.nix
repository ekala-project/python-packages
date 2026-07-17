{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "intelhex";
  version = "2.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-iStzYacZ9JRSN9qMz3VOlRPbMvViiFJ4WuoQjc0lAJM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "intelhex" ];

  meta = {
    description = "Python library for Intel HEX files manipulations";
    homepage = "https://github.com/bialix/intelhex";
    license = lib.licenses.bsd3;
  };
}
