{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  mako,
  sqlalchemy,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "alembic";
  version = "1.18.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-g6xrgTWVloFvs7iTCZhBoIYvIReyljJY6WXXDcYvuGY=";
  };

  build-system = [ setuptools ];

  dependencies = [
    mako
    sqlalchemy
    typing-extensions
  ];

  pythonImportsCheck = [ "alembic" ];

  meta = {
    homepage = "https://bitbucket.org/zzzeek/alembic";
    description = "Database migration tool for SQLAlchemy";
    license = lib.licenses.mit;
    mainProgram = "alembic";
  };
}
