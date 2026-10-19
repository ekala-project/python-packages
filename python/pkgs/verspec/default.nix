{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "verspec";
  version = "0.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-xFBMppeyBWzbS/pxIUYfWg6BgJJVtBwD3aS6gjY3wB4=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "verspec" ];

  meta = {
    description = "Flexible version handling";
    homepage = "https://github.com/jimporter/verspec";
    license = lib.licenses.bsd2;
  };
})
