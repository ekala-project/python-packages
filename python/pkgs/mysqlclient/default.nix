{
  lib,
  buildPythonPackage,
  fetchPypi,
  mariadb-connector-c,
  pkg-config,
}:

buildPythonPackage rec {
  pname = "mysqlclient";
  version = "2.2.8";
  format = "setuptools";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ mariadb-connector-c ];

  # Tests need a MySQL database
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-jtIMVhWpFdpFG7MIx9AwZkik/ZooCbqVyZJpAAYwYZk=";
  };

  meta = {
    description = "Python interface to MySQL";
    homepage = "https://github.com/PyMySQL/mysqlclient-python";
    license = lib.licenses.gpl2Only;
  };
}
