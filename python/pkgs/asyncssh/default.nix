{
  lib,
  bcrypt,
  buildPythonPackage,
  cryptography,
  fetchPypi,
  fido2,
  gssapi,
  ifaddr,
  libnacl,
  libsodium,
  nettle,
  openssh,
  openssl,
  pyopenssl,
  python-pkcs11,
  setuptools,
  stdenv,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "asyncssh";
  version = "2.24.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-QGTFkOWc4ujYKi9m018xINdlgotN9ePb+we0qMJGhsk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cryptography
    nettle
    typing-extensions
  ];

  buildInputs = [ libsodium ];

  optional-dependencies = {
    bcrypt = [ bcrypt ];
    fido2 = [ fido2 ];
    ifaddr = [ ifaddr ];
    gssapi = [ gssapi ];
    libnacl = [ libnacl ];
    pkcs11 = [ python-pkcs11 ];
    pyOpenSSL = [ pyopenssl ];
  };
  pythonImportsCheck = [ "asyncssh" ];

  meta = {
    description = "Asynchronous SSHv2 Python client and server library";
    homepage = "https://asyncssh.readthedocs.io/";
    license = with lib.licenses; [
      epl20 # or
      gpl2Plus
    ];
    maintainers = [ ];
  };
}
