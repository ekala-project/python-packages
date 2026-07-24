{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "connection-pool";
  version = "0.0.3";
  pyproject = true;

  src = fetchPypi {
    pname = "connection_pool";
    inherit version;
    hash = "sha256-v0Keeu9lkhxptO1I89SNPqwTg7BdLfkYhHBYQtl00Nw=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "connection_pool" ];

  meta = {
    description = "Thread-safe connection pool";
    homepage = "https://github.com/zhouyl/ConnectionPool";
    license = lib.licenses.mit;
  };
}
