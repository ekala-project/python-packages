{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pyfakefs";
  version = "6.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-BZ/QshdL/u1JnssKWbzP9VfyZ8xtiFr8Dlt254ttUNo=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "pyfakefs" ];

  meta = {
    description = "Fake file system that mocks the Python file system modules";
    homepage = "https://pyfakefs.org/";
    license = lib.licenses.asl20;
  };
}
