{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "kazoo";
  version = "2.11.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-V+fm9pKVyPkiURSI7reWgHKeFLuOs4LVytg6oRNFw2w=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "kazoo" ];

  meta = {
    description = "Higher Level Zookeeper Client";
    homepage = "https://kazoo.readthedocs.org";
    license = lib.licenses.asl20;
  };
})
