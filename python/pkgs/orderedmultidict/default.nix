{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "orderedmultidict";
  version = "1.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-FqeuhDLgLMmH0tbVry31k4JY+HyHBnXHPud6CSDm9KY=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  doCheck = false;

  pythonImportsCheck = [ "orderedmultidict" ];

  meta = {
    homepage = "https://github.com/gruns/orderedmultidict";
    description = "Ordered Multivalue Dictionary";
    license = lib.licenses.unlicense;
  };
}
