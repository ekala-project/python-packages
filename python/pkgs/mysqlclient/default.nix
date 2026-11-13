{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  mariadb-connector-c,
  pkg-config,
}:

buildPythonPackage (finalAttrs: {
  pname = "mysqlclient";
  version = "2.3.1";
  pyproject = true;

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ mariadb-connector-c ];

  # Tests need a MySQL database
  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-wH4bg7Uw/WxYiCWfNq+tGYDSH8szupc4RlDdI8j3Pqg=";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Python interface to MySQL";
    homepage = "https://github.com/PyMySQL/mysqlclient-python";
    license = lib.licenses.gpl2Only;
  };
})
