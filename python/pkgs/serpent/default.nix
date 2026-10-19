{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "serpent";
  version = "1.43";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-YtwkL9TqKlAzn09aqvbsxVYF7nR3DX6yAx52DZCg0RQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "serpent" ];

  meta = {
    description = "Simple serialization library based on ast.literal_eval";
    homepage = "https://github.com/irmen/Serpent";
    license = lib.licenses.mit;
  };
})
