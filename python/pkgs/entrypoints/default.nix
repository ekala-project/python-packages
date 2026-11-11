{
  lib,
  fetchPypi,
  buildPythonPackage,
  flit-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "entrypoints";
  version = "0.4.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-O+vZos0F4IsSO+dMJ3s23ko46JnbpqhKyZYuvgwi7OY=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "entrypoints" ];

  meta = {
    homepage = "https://github.com/takluyver/entrypoints";
    description = "Discover and load entry points from installed packages";
    license = lib.licenses.mit;
  };
})
