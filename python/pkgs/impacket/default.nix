{
  lib,
  buildPythonPackage,
  charset-normalizer,
  dsinternals,
  fetchPypi,
  flask,
  ldap3,
  ldapdomaindump,
  pyasn1,
  pyasn1-modules,
  pycryptodomex,
  pyopenssl,
  setuptools,
  six,
  writeText,
}:

let
  opensslConf = writeText "openssl.conf" ''
    openssl_conf = openssl_init

    [openssl_init]
    providers = provider_sect

    [provider_sect]
    default = default_sect
    legacy = legacy_sect

    [default_sect]
    activate = 1

    [legacy_sect]
    activate = 1
  '';
in
buildPythonPackage rec {
  pname = "impacket";
  version = "0.13.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-7ZHIAra+/2VGr9ImKUK8GhiLRnH7kex1HUah1m0ows8=";
  };

  pythonRelaxDeps = [ "pyopenssl" ];

  build-system = [ setuptools ];

  dependencies = [
    charset-normalizer
    dsinternals
    flask
    ldap3
    ldapdomaindump
    pyasn1
    pyasn1-modules
    pycryptodomex
    pyopenssl
    setuptools
    six
  ];

  makeWrapperArgs = [ "--set-default OPENSSL_CONF ${opensslConf}" ];

  pythonImportsCheck = [
    "impacket"
    "impacket.msada_guids"
  ];

  meta = {
    description = "Network protocols Constructors and Dissectors";
    homepage = "https://github.com/SecureAuthCorp/impacket";
    # Modified Apache Software License, Version 1.1
    license = lib.licenses.free;
    maintainers = [ ];
  };
}
