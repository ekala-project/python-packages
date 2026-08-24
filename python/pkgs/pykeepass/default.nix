{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  argon2-cffi,
  construct,
  lxml,
  pycryptodomex,
}:

buildPythonPackage rec {
  pname = "pykeepass";
  version = "4.1.1.post1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "libkeepass";
    repo = "pykeepass";
    tag = "v${version}";
    hash = "sha256-DeEz3zrUK3cXIvMK/32Zn3FPiNsenhpAb17Zgel826s=";
  };

  build-system = [ setuptools ];

  dependencies = [
    argon2-cffi
    construct
    lxml
    pycryptodomex
  ];

  propagatedNativeBuildInputs = [ argon2-cffi ];

  pythonImportsCheck = [ "pykeepass" ];

  meta = {
    homepage = "https://github.com/libkeepass/pykeepass";
    description = "Python library to interact with keepass databases (supports KDBX3 and KDBX4)";
    license = lib.licenses.gpl3Only;
    maintainers = [ ];
  };
}
