{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pep8";
  version = "1.7.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-/iSbUuIEmOWeC1xSVqpS7pn8KVsm7J6qhXdv/bn+Y3Q=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "pep8" ];

  meta = {
    homepage = "https://pep8.readthedocs.org/";
    description = "Python style guide checker";
    license = lib.licenses.mit;
  };
}
