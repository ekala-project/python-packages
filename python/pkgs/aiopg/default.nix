{
  lib,
  async-timeout,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  psycopg2,
}:

buildPythonPackage rec {
  pname = "aiopg";
  version = "1.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aio-libs";
    repo = "aiopg";
    tag = "v${version}";
    hash = "sha256-GD5lRSUjASTwBk5vEK8v3xD8eNyxpwSrO3HHvtwubmk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    async-timeout
    psycopg2
  ];

  postPatch = ''
    substituteInPlace setup.py \
      --replace "psycopg2-binary" "psycopg2"
  '';

  # Tests requires a PostgreSQL Docker instance

  pythonImportsCheck = [ "aiopg" ];

  meta = {
    description = "Python library for accessing a PostgreSQL database";
    homepage = "https://aiopg.readthedocs.io/";
    license = lib.licenses.bsd2;
  };
}
