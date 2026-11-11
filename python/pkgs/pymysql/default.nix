{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  cryptography,
}:

buildPythonPackage (finalAttrs: {
  pname = "pymysql";
  version = "1.2.4";
  pyproject = true;

  src = fetchPypi {
    pname = "pymysql";
    inherit (finalAttrs) version;
    hash = "sha256-SRVYFluOEfNkTF+c+zDMnJER/9VOU9OqkbmgogviKU8=";
  };

  build-system = [ setuptools ];

  dependencies = [ cryptography ];

  # Wants to connect to MySQL

  meta = {
    description = "Pure Python MySQL Client";
    homepage = "https://github.com/PyMySQL/PyMySQL";
    license = lib.licenses.mit;
  };
})
