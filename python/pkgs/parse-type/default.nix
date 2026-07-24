{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
  parse,
  six,
}:

buildPythonPackage rec {
  pname = "parse-type";
  version = "0.6.6";
  pyproject = true;

  src = fetchPypi {
    pname = "parse_type";
    inherit version;
    hash = "sha256-UTo3hBBIOXcNaQ4EM5qLTTNDn81d2Z8uRYD5/BCXv7I=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    parse
    six
  ];

  pythonImportsCheck = [ "parse_type" ];

  doCheck = false;

  meta = {
    homepage = "https://github.com/jenisys/parse_type";
    description = "Simplifies to build parse types based on the parse module";
    license = lib.licenses.bsd3;
  };
}
