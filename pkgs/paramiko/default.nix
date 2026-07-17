{
  lib,
  bcrypt,
  buildPythonPackage,
  cryptography,
  fetchPypi,
  invoke,
  pynacl,
  setuptools,
}:

buildPythonPackage rec {
  pname = "paramiko";
  version = "4.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-aiXwezgMycmojSuSCtNxZ6xGZ/jZiGzOvY+Q9lS11p8=";
  };

  build-system = [ setuptools ];

  dependencies = [
    bcrypt
    cryptography
    invoke
    pynacl
  ];

  __darwinAllowLocalNetworking = true;

  pythonImportsCheck = [ "paramiko" ];

  meta = {
    homepage = "https://github.com/paramiko/paramiko/";
    description = "Native Python SSHv2 protocol library";
    license = lib.licenses.lgpl21Plus;
    longDescription = ''
      Library for making SSH2 connections (client or server). Emphasis is
      on using SSH2 as an alternative to SSL for making secure connections
      between python scripts. All major ciphers and hash methods are
      supported. SFTP client and server mode are both supported too.
    '';
  };
}
