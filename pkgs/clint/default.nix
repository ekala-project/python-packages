{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  args,
}:

buildPythonPackage rec {
  pname = "clint";
  version = "0.5.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-BSJMMrEHVWPQsW0AFfqvnaQ6ohTkohQOUfCHieekxao=";
  };

  build-system = [ setuptools ];

  dependencies = [ args ];

  pythonImportsCheck = [ "clint" ];

  meta = {
    description = "Python Command Line Interface Tools";
    homepage = "https://github.com/kennethreitz/clint";
    license = lib.licenses.isc;
  };
}
