{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "hiredis";
  version = "3.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-2hkzE1RDOvaixUwh8tcLoISTPA19LENXjsXFtEZnStU=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "hiredis" ];

  meta = {
    description = "Wraps protocol parsing code in hiredis, speeds up parsing of multi bulk replies";
    homepage = "https://github.com/redis/hiredis-py";
    license = lib.licenses.bsd3;
  };
}
