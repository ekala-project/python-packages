{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  cffi,
  hatchling,
  setuptools,

  # dependencies
  cryptography,
  hyperlink,
  pynacl,
  txaio,

  # optional-dependencies
  # encryption
  base58,
  pyopenssl,
  qrcode,
  service-identity,
  # scram
  argon2-cffi,
  passlib,
  # serialization
  cbor2,
  flatbuffers,
  msgpack,
  ujson,
  py-ubjson,
  # twisted
  attrs,
  twisted,
  zope-interface,
}:

buildPythonPackage (finalAttrs: {
  pname = "autobahn";
  version = "25.12.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "crossbario";
    repo = "autobahn-python";
    tag = "v${finalAttrs.version}";
    hash = "sha256-vSS7DpfGfNwQT8OsgEXJaP5J40QFIopdAD94/y7/jFY=";
  };

  build-system = [
    cffi
    hatchling
    setuptools
  ];

  dependencies = [
    cryptography
    hyperlink
    pynacl
    txaio
  ];

  optional-dependencies = lib.fix (self: {
    all =
      self.accelerate ++ self.encryption ++ self.nvx ++ self.serialization ++ self.scram ++ self.twisted;
    accelerate = [
      # wsaccel
    ];
    encryption = [
      base58
      pynacl
      pyopenssl
      qrcode
      service-identity
    ];
    nvx = [ cffi ];
    scram = [
      argon2-cffi
      cffi
      passlib
    ];
    serialization = [
      cbor2
      flatbuffers
      msgpack
      ujson
      py-ubjson
    ];
    twisted = [
      attrs
      twisted
      zope-interface
    ];
  });

  pythonImportsCheck = [ "autobahn" ];

  meta = {
    description = "WebSocket and WAMP in Python for Twisted and asyncio";
    homepage = "https://crossbar.io/autobahn";
    downloadPage = "https://github.com/crossbario/autobahn-python";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
