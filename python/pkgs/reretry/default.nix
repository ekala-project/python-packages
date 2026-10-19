{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "reretry";
  version = "0.11.8";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-8nkfzr5RLqLx0VOih0d4UjqAZIYLWRzZCvwhqL7UMuM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "reretry" ];

  meta = {
    description = "Easy to use retry decorator";
    homepage = "https://github.com/leshchenko1979/reretry";
    license = lib.licenses.asl20;
  };
})
