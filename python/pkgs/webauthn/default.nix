{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  asn1crypto,
  cbor2,
  cryptography,
  pyasn1,
  pyasn1-modules,
  pyopenssl,
}:

buildPythonPackage rec {
  pname = "webauthn";
  version = "3.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "duo-labs";
    repo = "py_webauthn";
    tag = "v${version}";
    hash = "sha256-rT/B95ILb2cI/HH01IC5b4319zdKnrf4ZLUIpAeC3fM=";
  };

  build-system = [ setuptools ];

  dependencies = [
    asn1crypto
    cbor2
    cryptography
    pyasn1
    pyasn1-modules
    pyopenssl
  ];

  pythonRelaxDeps = [ "cbor2" ];
  pythonImportsCheck = [ "webauthn" ];

  meta = {
    description = "Implementation of the WebAuthn API";
    homepage = "https://github.com/duo-labs/py_webauthn";
    license = lib.licenses.bsd3;
  };
}
