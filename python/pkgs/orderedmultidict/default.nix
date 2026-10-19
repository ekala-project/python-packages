{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "orderedmultidict";
  version = "1.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-FqeuhDLgLMmH0tbVry31k4JY+HyHBnXHPud6CSDm9KY=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "orderedmultidict" ];

  meta = {
    homepage = "https://github.com/gruns/orderedmultidict";
    description = "Ordered Multivalue Dictionary";
    license = lib.licenses.unlicense;
  };
})
