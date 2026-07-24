{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "natsort";
  version = "8.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-RTEsSg5VB1k9oZPe3QSrsUaSU7YB7K9jRFrYDwoepYE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "natsort" ];

  meta = {
    homepage = "https://github.com/SethMMorton/natsort";
    description = "Natural sorting for Python";
    license = lib.licenses.mit;
  };
}
