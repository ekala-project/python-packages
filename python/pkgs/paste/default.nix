{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "paste";
  version = "3.10.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-HD0SBlpeinoYwMe+FlOpfPOMw+mloMgzSp3ZktOgXko=";
  };

  build-system = [ setuptools ];

  dependencies = [
    setuptools
    six
  ];

  doCheck = false;

  pythonImportsCheck = [ "paste" ];

  meta = {
    homepage = "https://pythonpaste.readthedocs.io/";
    description = "Tools for using a Web Server Gateway Interface stack";
    license = lib.licenses.mit;
  };
}
