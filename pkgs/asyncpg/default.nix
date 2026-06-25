{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  cython,
  setuptools,
}:

buildPythonPackage rec {
  pname = "asyncpg";
  version = "0.31.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-yYk4bIOUC/vXhxgPKxUZQV4tPWJ3pw2dDwFFrHNQBzU=";
  };

  build-system = [
    cython
    setuptools
  ];

  pythonImportsCheck = [ "asyncpg" ];

  meta = {
    description = "Asyncio PosgtreSQL driver";
    homepage = "https://github.com/MagicStack/asyncpg";
    longDescription = ''
      Asyncpg is a database interface library designed specifically for
      PostgreSQL and Python/asyncio. asyncpg is an efficient, clean
      implementation of PostgreSQL server binary protocol for use with Python's
      asyncio framework.
    '';
    license = lib.licenses.asl20;
  };
}
