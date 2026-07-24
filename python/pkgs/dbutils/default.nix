{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "dbutils";
  version = "3.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-FgtXiBVPGt7dxhCA2v8VMLTfK6DUWvHDv7rHbbJBhrM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "dbutils" ];

  meta = {
    description = "Database connections for multi-threaded environments";
    homepage = "https://webwareforpython.github.io/DBUtils/";
    license = lib.licenses.mit;
  };
}
