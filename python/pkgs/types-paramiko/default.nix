{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  cryptography,
}:

buildPythonPackage rec {
  pname = "types-paramiko";
  version = "5.0.0.20260724";
  pyproject = true;

  src = fetchPypi {
    pname = "types_paramiko";
    inherit version;
    hash = "sha256-N+fz8hls8YfIlkmtg2YhxnW8MYNp2A+ngFFQekrncMk=";
  };

  build-system = [ setuptools ];

  dependencies = [ cryptography ];

  meta = {
    description = "Typing stubs for paramiko";
    homepage = "https://github.com/python/typeshed";
    license = lib.licenses.asl20;
  };
}
