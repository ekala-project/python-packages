{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  asn1crypto,
  cryptography,
  h11,
}:

buildPythonPackage rec {
  pname = "asysocks";
  version = "0.2.18";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-zGGW6CyK3Is84jId3fY1UAx2AxbaS3zKMhtTLLs9/fU=";
  };

  build-system = [ setuptools ];

  dependencies = [
    asn1crypto
    cryptography
    h11
  ];

  pythonImportsCheck = [ "asysocks" ];

  meta = {
    description = "Python Socks4/5 client and server library";
    homepage = "https://github.com/skelsec/asysocks";
    license = lib.licenses.mit;
  };
}
