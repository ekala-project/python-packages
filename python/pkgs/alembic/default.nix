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
  version = "1.19.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-KXlQqKkfZ3Drgr+86b6lXHKLkKU4bG6BQwGRoxnROLA=";
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
