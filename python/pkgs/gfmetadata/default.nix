{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  setuptools-scm,
  # dependencies
  protobuf,
}:

buildPythonPackage (finalAttrs: {
  pname = "gfmetadata";
  version = "0.2.5";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-wCW4Aclid/Ihx93ro/NSXjTije5pg4Vi3gjmDAYT/RQ=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ protobuf ];

  pythonImportsCheck = [ "gfmetadata" ];

  meta = {
    description = "Python API for interacting with Google Fonts protobuf definitions";
    homepage = "https://github.com/googlefonts/gf-metadata";
    license = lib.licenses.asl20;
  };
})
