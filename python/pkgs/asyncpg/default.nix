{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  cython,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "asyncpg";
  version = "0.32.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-ReZOVnFNiIMwuISq0d+zY9C/Q/s0Pj0aiWhSXzut5Hg=";
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
})
