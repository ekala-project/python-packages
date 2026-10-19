{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "oset";
  version = "0.1.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "017rr1m72s2fh9bmz5vrvc5mshczgzisi5894v9zkvvfr7gdf7sc";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Ordered set";
    license = lib.licenses.psfl;
  };
})
