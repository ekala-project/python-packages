{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "readlike";
  version = "0.1.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-RIa6XxwXcNxkWDFuy5XqEuG6f1nzKIBPoXqCErdD/Ag=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "readlike" ];

  meta = {
    description = "GNU Readline-like line editing module";
    homepage = "https://github.com/jangler/readlike";
    license = lib.licenses.mit;
  };
}
