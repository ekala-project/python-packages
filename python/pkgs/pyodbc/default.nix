{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  isPyPy,
  unixodbc,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyodbc";
  version = "5.5.0";
  pyproject = true;

  disabled = isPyPy; # use pypypdbc instead

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-eniHPKxmsoV79JCiSj46raJPg5U06Xxn4Xf2kefXAaw=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [
    unixodbc # for odbc_config
  ];

  buildInputs = [ unixodbc ];

  # Tests require a database server
  pythonImportsCheck = [ "pyodbc" ];

  meta = {
    description = "Python ODBC module to connect to almost any database";
    homepage = "https://github.com/mkleehammer/pyodbc";
    license = lib.licenses.mit;
    platforms = lib.platforms.unix;
  };
})
