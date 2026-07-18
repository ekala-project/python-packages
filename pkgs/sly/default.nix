{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "sly";
  version = "0.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-JR1CAV6FBxWK7CFk8GA130qCsDFM5kUPRX1xJedkkCQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "sly" ];

  meta = {
    description = "Improved PLY implementation of lex and yacc for Python 3";
    homepage = "https://github.com/dabeaz/sly";
    license = lib.licenses.bsd3;
  };
}
