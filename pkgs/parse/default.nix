{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "parse";
  version = "1.22.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-06R0DsPaM44rJYstaXQbcx6t/dylniShS8TuX844yRE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "parse" ];

  doCheck = false;

  meta = {
    homepage = "https://github.com/r1chardj0n3s/parse";
    description = "parse() is the opposite of format()";
    license = lib.licenses.bsdOriginal;
  };
}
