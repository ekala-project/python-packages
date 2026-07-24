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
  version = "1.18.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-FVSYIiHdF+mnSbU5AkB1eOswXkU/cZmejH8KSDif/44=";
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
