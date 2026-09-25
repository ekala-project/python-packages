{
  buildPythonPackage,
  fetchFromGitHub,
  mariadb-connector-c,
  packaging,
  lib,
  setuptools,
}:

buildPythonPackage rec {
  pname = "mariadb";
  version = "1.1.14";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mariadb-corporation";
    repo = "mariadb-connector-python";
    tag = "v${version}";
    hash = "sha256-BPyEBQ5M/kqTKpZX/incgTX/+E1dMZW98GuywsBeCJw=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [
    mariadb-connector-c # for mariadb_config
  ];

  buildInputs = [ mariadb-connector-c ];

  dependencies = [
    packaging # do not rely on pythonImportsCheck when removing, it pulls in build-system dependencies
  ];

  # Requires a running MariaDB instance

  pythonImportsCheck = [ "mariadb" ];

  meta = {
    description = "MariaDB Connector/Python";
    homepage = "https://github.com/mariadb-corporation/mariadb-connector-python";
    license = lib.licenses.lgpl21Plus;
  };
}
