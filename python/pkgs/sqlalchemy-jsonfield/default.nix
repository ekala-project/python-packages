{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  sqlalchemy,
  setuptools-scm,
  setuptools,
  pytest-sugar,
  pymysql,
  psycopg2,
}:

buildPythonPackage rec {
  pname = "sqlalchemy-jsonfield";
  version = "1.0.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "penguinolog";
    repo = "sqlalchemy_jsonfield";
    tag = version;
    hash = "sha256-htzWMItAQ1MdOcWHe9le5UofXi5plNpBqOAkgbPxCYI=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    sqlalchemy
  ];
  pythonImportsCheck = [ "sqlalchemy_jsonfield" ];

  meta = {
    description = "SQLALchemy JSONField implementation for storing dicts at SQL independently from JSON type support";
    homepage = "https://github.com/penguinolog/sqlalchemy_jsonfield";
    license = lib.licenses.asl20;
  };
}
