{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "funcsigs";
  version = "1.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-p7sPLPOj/Rqycyy0nrpCUsKvQkBEJBW0q847hwIqj1A=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "funcsigs" ];

  meta = {
    homepage = "https://github.com/aliles/funcsigs";
    description = "Python function signatures from PEP362 for Python 2.6, 2.7 and 3.2+";
    license = lib.licenses.asl20;
  };
}
