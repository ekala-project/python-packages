{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  robotframework,
  paramiko,
  scp,
}:

buildPythonPackage (finalAttrs: {
  version = "3.8.0";
  pyproject = true;
  pname = "robotframework-sshlibrary";

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "aedf8a02bcb7344404cf8575d0ada25d6c7dc2fcb65de2113c4e07c63d2446c2";
  };

  build-system = [ setuptools ];

  dependencies = [
    robotframework
    paramiko
    scp
  ];

  meta = {
    description = "SSHLibrary is a Robot Framework test library for SSH and SFTP";
    homepage = "https://github.com/robotframework/SSHLibrary";
    license = lib.licenses.asl20;
  };
})
