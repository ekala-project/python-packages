{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "appdirs";
  version = "1.4.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-fV0BZ7KxuoIWR2Fq9Gp0nRxlN0DdDSQVEA/ibiev30E=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "appdirs" ];

  meta = {
    description = "Python module for determining appropriate platform-specific dirs";
    homepage = "https://github.com/ActiveState/appdirs";
    license = lib.licenses.mit;
  };
}
