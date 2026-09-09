{
  lib,
  stdenv,
  asyncssh,
  bcrypt,
  buildPythonPackage,
  fetchFromGitHub,
  fsspec,
  importlib-metadata,
  mock-ssh-server,
  pytest-asyncio,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "sshfs";
  version = "2026.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fsspec";
    repo = "sshfs";
    tag = version;
    hash = "sha256-Gw9fAVAxQxVge7APxrdGXpmhYZlyqmcB2QU9+2ze9dw=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    asyncssh
    fsspec
  ];

  optional-dependencies = {
    bcrypt = [ asyncssh ] ++ asyncssh.optional-dependencies.bcrypt;
    fido2 = [ asyncssh ] ++ asyncssh.optional-dependencies.fido2;
    gssapi = [ asyncssh ] ++ asyncssh.optional-dependencies.gssapi;
    libnacl = [ asyncssh ] ++ asyncssh.optional-dependencies.libnacl;
    pkcs11 = [ asyncssh ] ++ asyncssh.optional-dependencies.pkcs11;
    pyopenssl = [ asyncssh ] ++ asyncssh.optional-dependencies.pyOpenSSL;
  };
  pythonImportsCheck = [ "sshfs" ];

  meta = {
    description = "SSH/SFTP implementation for fsspec";
    homepage = "https://github.com/fsspec/sshfs/";
    license = lib.licenses.asl20;
  };
}
