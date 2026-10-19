{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  pymongo,
}:

buildPythonPackage (finalAttrs: {
  pname = "mongodict";
  version = "0.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "0nv5amfs337m0gbxpjb0585s20rndqfc3mfrzq1iwgnds5gxcrlw";
  };

  build-system = [ setuptools ];

  dependencies = [ pymongo ];

  meta = {
    description = "MongoDB-backed Python dict-like interface";
    homepage = "https://github.com/turicas/mongodict/";
    license = lib.licenses.gpl3;
  };
})
