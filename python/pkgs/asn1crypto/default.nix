{
  lib,
  buildPythonPackage,
  python,
  fetchFromGitHub,

  # build system
  setuptools,
}:

let
  provenance =
    if lib.versionOlder python.version "3.12" then
      rec {
        version = "1.5.1";
        rev = version;
        hash = "sha256-M8vASxhaJPgkiTrAckxz7gk/QHkrFlNz7fFbnLEBT+M=";
      }
    else
      {
        version = "1.5.1-unstable-2023-11-03";
        rev = "b763a757bb2bef2ab63620611ddd8006d5e9e4a2";
        hash = "sha256-11WajEDtisiJsKQjZMSd5sDog3DuuBzf1PcgSY+uuXY=";
      };
in

buildPythonPackage {
  pname = "asn1crypto";
  pyproject = true;
  inherit (provenance) version;

  src = fetchFromGitHub {
    owner = "wbond";
    repo = "asn1crypto";
    inherit (provenance) rev hash;
  };

  nativeBuildInputs = [ setuptools ];

  meta = {
    description = "Fast ASN.1 parser and serializer with definitions for private keys, public keys, certificates, CRL, OCSP, CMS, PKCS#3, PKCS#7, PKCS#8, PKCS#12, PKCS#5, X.509 and TSP";
    license = lib.licenses.mit;
    homepage = "https://github.com/wbond/asn1crypto";
  };
}
