{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  redis,
  sortedcontainers,
}:

buildPythonPackage (finalAttrs: {
  pname = "fakeredis";
  version = "2.40.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-FusFo+l8N6Azxz0dp+iF6yqke6dgTMN3FEM576J4CgI=";
  };

  build-system = [ hatchling ];

  dependencies = [
    redis
    sortedcontainers
  ];

  pythonImportsCheck = [ "fakeredis" ];

  meta = {
    description = "Fake implementation of Redis API";
    homepage = "https://github.com/cunla/fakeredis-py";
    license = lib.licenses.bsd3;
  };
})
