{
  lib,
  asn1crypto,
  asysocks,
  buildPythonPackage,
  fetchPypi,
  minikerberos,
  setuptools,
  unicrypto,
}:

buildPythonPackage (finalAttrs: {
  pname = "asyauth";
  version = "0.0.25";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-YyZZnnlRvfn9Hf7iCBHbvvQfX91ZHbzLjYr21O3DZ3U=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "asysocks"
    "minikerberos"
  ];

  dependencies = [
    asn1crypto
    asysocks
    minikerberos
    unicrypto
  ];

  # Project doesn't have tests

  pythonImportsCheck = [ "asyauth" ];

  meta = {
    description = "Unified authentication library";
    homepage = "https://github.com/skelsec/asyauth";
    license = lib.licenses.mit;
  };
})
