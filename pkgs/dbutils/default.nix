{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "dbutils";
  version = "3.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-reefvFeG10ltQThyL7yiQ0DPfHO11m3wUpb2Vv8Ia78=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "dbutils" ];

  meta = {
    description = "Database connections for multi-threaded environments";
    homepage = "https://webwareforpython.github.io/DBUtils/";
    license = lib.licenses.mit;
  };
}
