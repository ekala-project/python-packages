{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  cryptography,
}:

buildPythonPackage rec {
  pname = "types-paramiko";
  version = "4.0.0.20250822";
  pyproject = true;

  src = fetchPypi {
    pname = "types_paramiko";
    inherit version;
    hash = "sha256-G1awy9Puw9L9EjyesnBOYSt3fhWhdwWoBCeeplJeDFM=";
  };

  build-system = [ setuptools ];

  dependencies = [ cryptography ];

  meta = {
    description = "Typing stubs for paramiko";
    homepage = "https://github.com/python/typeshed";
    license = lib.licenses.asl20;
  };
}
