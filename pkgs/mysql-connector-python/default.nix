{
  lib,
  buildPythonPackage,
  dnspython,
  fetchFromGitHub,
  protobuf,
  mysql84,
  openssl,
  pkgs,
}:

buildPythonPackage rec {
  pname = "mysql-connector";
  version = "9.7.0";
  format = "setuptools";

  setupPyBuildFlags = [
    "--with-mysql-capi=${mysql84}"
    "--with-openssl-include-dir=${openssl.dev}/include"
    "--with-openssl-lib-dir=${lib.getLib openssl}/lib"
    "-L"
    "${lib.getLib pkgs.zstd}/lib:${lib.getLib mysql84}/lib"
  ];

  src = fetchFromGitHub {
    owner = "mysql";
    repo = "mysql-connector-python";
    tag = version;
    hash = "sha256-D4aAkdIfAcsQumjROA6/+KB6CcjVYcq7yo4FeVUZtX0=";
  };

  sourceRoot = "${src.name}/mysql-connector-python";

  patches = [
    ./0001-Revert-Fix-MacOS-wheels-platform-tag.patch
  ];

  nativeBuildInputs = [ mysql84 ];

  buildInputs = [
    mysql84
    openssl
    pkgs.zlib
    pkgs.zstd
  ];

  propagatedBuildInputs = [
    dnspython
    protobuf
  ];

  pythonImportsCheck = [ "mysql" ];

  # Tests require a running MySQL instance
  doCheck = false;

  meta = {
    description = "MySQL driver";
    longDescription = ''
      A MySQL driver that does not depend on MySQL C client libraries and
      implements the DB API v2.0 specification.
    '';
    homepage = "https://github.com/mysql/mysql-connector-python";
    license = lib.licenses.gpl2Only;
  };
}
