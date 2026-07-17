{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  alembic,
  flask,
  flask-sqlalchemy,
}:

buildPythonPackage rec {
  pname = "flask-migrate";
  version = "4.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "flask_migrate";
    inherit version;
    hash = "sha256-GjNrBussOs4AX18t7YZB1TTBh5jWQGH2/xH3nhQ0Em0=";
  };

  build-system = [ setuptools ];

  dependencies = [
    alembic
    flask
    flask-sqlalchemy
  ];

  doCheck = false;

  pythonImportsCheck = [ "flask_migrate" ];

  meta = {
    description = "SQLAlchemy database migrations for Flask applications using Alembic";
    homepage = "https://github.com/miguelgrinberg/Flask-Migrate";
    license = lib.licenses.mit;
  };
}
