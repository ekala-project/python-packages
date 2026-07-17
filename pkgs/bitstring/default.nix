{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "bitstring";
  version = "4.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-o5HbiCisRIXdXOcsgLJ+usPnuYljE1mVnjEM2XKXI7I=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "bitstring" ];

  meta = {
    description = "Module for binary data manipulation";
    homepage = "https://github.com/scott-griffiths/bitstring";
    license = lib.licenses.mit;
  };
}
