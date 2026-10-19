{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  poetry-core,
  # dependencies
  cryptography,
  pycryptodomex,
}:

buildPythonPackage (finalAttrs: {
  pname = "pysnmpcrypto";
  version = "0.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "lextudio";
    repo = "pysnmpcrypto";
    tag = "v${finalAttrs.version}";
    hash = "sha256-gNRD8mSWVVLXwJjb3nT7IKnjTdwTutFDnQybgZTY2b0=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    cryptography
    pycryptodomex
  ];

  pythonImportsCheck = [ "pysnmpcrypto" ];

  meta = {
    description = "Strong crypto support for Python SNMP library";
    homepage = "https://github.com/lextudio/pysnmpcrypto";
    license = lib.licenses.bsd2;
  };
})
