{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  appdirs,
}:

buildPythonPackage rec {
  pname = "rply";
  version = "0.7.8";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-KoCKwlpFgKmZH8ME1kQ04pmo/HV2BXRJLyQsu1uzAck=";
  };

  build-system = [ setuptools ];

  dependencies = [ appdirs ];

  pythonImportsCheck = [ "rply" ];

  meta = {
    description = "Python Lex/Yacc that works with RPython";
    homepage = "https://github.com/alex/rply";
    license = lib.licenses.bsd3;
  };
}
