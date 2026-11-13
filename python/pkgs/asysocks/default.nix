{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  asn1crypto,
  cryptography,
  h11,
}:

buildPythonPackage (finalAttrs: {
  pname = "asysocks";
  version = "0.2.19";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-yP+hVK18pGqqBsH4bzR7wg87jGlhhrCPxBk3kSErK+w=";
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
})
