{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "dbutils";
  version = "3.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-3+P16244MELWitB+Tpd4squ8xGJ6KD+F78ghAxnAddI=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "dbutils" ];

  meta = {
    description = "Database connections for multi-threaded environments";
    homepage = "https://webwareforpython.github.io/DBUtils/";
    license = lib.licenses.mit;
  };
}
