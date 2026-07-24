{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "astor";
  version = "0.8.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-am7/2pP04c6fYYd5st0dnYTx4ygSwjops//2/X9j+l4=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "astor" ];

  meta = {
    description = "Library for reading, writing and rewriting python AST";
    homepage = "https://github.com/berkerpeksag/astor";
    license = lib.licenses.bsd3;
  };
}
