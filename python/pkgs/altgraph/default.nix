{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "altgraph";
  version = "0.17.5";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-yHs5XdEvq96cmVc6l0nWfajSnvneASXH9TZpm0qbyec=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "altgraph" ];

  meta = {
    description = "Fork of graphlib: a graph (network) package for constructing graphs";
    homepage = "https://altgraph.readthedocs.io/";
    license = lib.licenses.mit;
  };
})
