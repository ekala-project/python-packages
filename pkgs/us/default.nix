{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  jellyfish,
}:

buildPythonPackage rec {
  pname = "us";
  version = "3.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-yyI+hTk9zFFx6tDdISutxH+WZ7I3AP6j5+pfMQ1UUzg=";
  };

  build-system = [ setuptools ];

  dependencies = [ jellyfish ];

  pythonImportsCheck = [ "us" ];

  meta = {
    description = "Package for easily working with US and state metadata";
    homepage = "https://github.com/unitedstates/python-us/";
    license = lib.licenses.bsd3;
  };
}
