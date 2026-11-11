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

buildPythonPackage (finalAttrs: {
  pname = "alembic";
  version = "1.20.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-g0kN7x9yNBPbUJZZH3YJrFJUSAW+k4SRcAiO0E9aLgs=";
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
})
