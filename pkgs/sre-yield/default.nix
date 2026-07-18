{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "sre_yield";
  version = "1.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-6U8aKjy6//4dzRXB1U5AGhUX4FKqZMfTFk+I3HYde4o=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "sre_yield" ];

  meta = {
    description = "Python library to efficiently generate all values that can match a given regular expression";
    homepage = "https://github.com/sre-yield/sre-yield";
    license = lib.licenses.asl20;
  };
}
