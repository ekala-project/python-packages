{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  sqlalchemy,
}:

buildPythonPackage rec {
  pname = "sqlalchemy-utils";
  version = "0.41.2";
  pyproject = true;

  src = fetchPypi {
    pname = "SQLAlchemy-Utils";
    inherit version;
    hash = "sha256-vFmcjDszGeU85sXDxHESC9Ml0AcftvOKEOkk49B7mZA=";
  };

  build-system = [ setuptools ];

  dependencies = [ sqlalchemy ];

  pythonImportsCheck = [ "sqlalchemy_utils" ];

  meta = {
    description = "Various utility functions and datatypes for SQLAlchemy";
    homepage = "https://github.com/kvesteri/sqlalchemy-utils";
    license = lib.licenses.bsd3;
  };
}
