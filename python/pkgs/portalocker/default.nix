{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  uv-build,

  # optional-dependencies
  redis,
}:

buildPythonPackage (finalAttrs: {
  pname = "portalocker";
  version = "4.4.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-eshbsqo8eHO/KsclhvxhVK+kZxrHhplKFmF6a3zLPl4=";
  };

  build-system = [ uv-build ];

  optional-dependencies.redis = [ redis ];

  pythonImportsCheck = [ "portalocker" ];

  meta = {
    description = "Library to provide an easy API to file locking";
    homepage = "https://github.com/WoLpH/portalocker";
    license = lib.licenses.bsd3;
  };
})
