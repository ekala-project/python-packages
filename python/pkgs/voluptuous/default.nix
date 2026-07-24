{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "voluptuous";
  version = "0.16.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-AGU14i/tlErsF7726HJUckdhlHQ8h70jPpEutGP4/wU=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "voluptuous" ];

  meta = {
    homepage = "https://github.com/alecthomas/voluptuous";
    description = "Python data validation library";
    license = lib.licenses.bsd3;
  };
}
