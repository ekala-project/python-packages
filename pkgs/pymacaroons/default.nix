{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  six,
  pynacl,
}:

buildPythonPackage rec {
  pname = "pymacaroons";
  version = "0.13.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Hmu6QqX2bCRa3zilpABqmdzAagcDeG6mNgmGZ9QpA7g=";
  };

  build-system = [ setuptools ];

  dependencies = [
    six
    pynacl
  ];

  pythonImportsCheck = [ "pymacaroons" ];

  meta = {
    description = "Macaroon library for Python";
    homepage = "https://github.com/ecordell/pymacaroons";
    license = lib.licenses.mit;
  };
}
