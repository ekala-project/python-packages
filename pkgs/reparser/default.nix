{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "reparser";
  version = "1.4.3";
  pyproject = true;

  src = fetchPypi {
    pname = "ReParser";
    inherit version;
    hash = "sha256-5pyvWKKdbgRyP2p6RW0wS3rPz0E5V9r82Q7knszC0Vo=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "reparser" ];

  meta = {
    description = "Simple regex-based lexer/parser for inline markup";
    homepage = "https://github.com/xmikos/reparser";
    license = lib.licenses.mit;
  };
}
