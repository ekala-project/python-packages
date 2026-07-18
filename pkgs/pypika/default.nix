{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pypika";
  version = "0.50.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-L/ZqFTrcjYh3h5/yq9WjsFCl0q39+GWdNAIHbjheNbM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pypika" ];

  meta = {
    description = "Python SQL query builder";
    homepage = "https://github.com/kayak/pypika";
    license = lib.licenses.asl20;
  };
})
