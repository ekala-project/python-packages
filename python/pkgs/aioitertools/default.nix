{
  lib,
  buildPythonPackage,
  fetchPypi,

  # native
  flit-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "aioitertools";
  version = "0.13.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-YgvSQazAu7nsgZ8ashWGaHG0u9H3ODalX3mSAO6GlQw=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "aioitertools" ];

  meta = {
    description = "Implementation of itertools, builtins, and more for AsyncIO and mixed-type iterables";
    homepage = "https://aioitertools.omnilib.dev/";
    license = lib.licenses.mit;
  };
})
