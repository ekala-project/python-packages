{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "derpconf";
  version = "0.8.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-66MOqcWIiqJrORJDgAH5iUblHyqJvuf9DIBN56XjKwU=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "derpconf" ];

  meta = {
    description = "Module to abstract loading configuration files for your app";
    homepage = "https://github.com/globocom/derpconf";
    license = lib.licenses.mit;
  };
}
