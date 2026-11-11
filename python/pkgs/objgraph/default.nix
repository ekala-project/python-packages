{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "objgraph";
  version = "3.7.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-tu9LJEIXQQUJsleXBBOwGpedVN9I0tQFW2lB6Ged27s=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "objgraph" ];

  meta = {
    homepage = "https://mg.pov.lt/objgraph/";
    description = "Draws Python object reference graphs with graphviz";
    license = lib.licenses.mit;
  };
})
