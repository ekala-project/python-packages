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
  version = "2025.11.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fsspec";
    repo = "sshfs";
    tag = version;
    hash = "sha256-TrFrjORH6VebTBq+OHJUEr55DtjL58/b+qQLpbSU7MU=";
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
