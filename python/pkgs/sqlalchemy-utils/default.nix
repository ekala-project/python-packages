{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  sqlalchemy,
}:

buildPythonPackage (finalAttrs: {
  pname = "sqlalchemy-utils";
  version = "0.43.0";
  pyproject = true;

  src = fetchPypi {
    pname = "sqlalchemy_utils";
    inherit (finalAttrs) version;
    hash = "sha256-fodB28LA+ZLSGBzWneE94pKzoqUwWp2oMuENVAq87b8=";
  };

  build-system = [ setuptools ];

  dependencies = [ sqlalchemy ];

  pythonImportsCheck = [ "sqlalchemy_utils" ];

  meta = {
    description = "Various utility functions and datatypes for SQLAlchemy";
    homepage = "https://github.com/kvesteri/sqlalchemy-utils";
    license = lib.licenses.bsd3;
  };
})
