{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "rfc3339-validator";
  version = "0.1.4";
  pyproject = true;

  src = fetchPypi {
    pname = "rfc3339_validator";
    inherit (finalAttrs) version;
    sha256 = "0srg0b89aikzinw72s433994k5gv5lfyarq1adhas11kz6yjm2hk";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "rfc3339_validator" ];

  meta = {
    description = "RFC 3339 validator for Python";
    homepage = "https://github.com/naimetti/rfc3339-validator";
    license = lib.licenses.mit;
  };
})
