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
  version = "2.2.8";
  pyproject = true;

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ mariadb-connector-c ];

  # Tests need a MySQL database
  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-jtIMVhWpFdpFG7MIx9AwZkik/ZooCbqVyZJpAAYwYZk=";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Python interface to MySQL";
    homepage = "https://github.com/PyMySQL/mysqlclient-python";
    license = lib.licenses.gpl2Only;
  };
})
