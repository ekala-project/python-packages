{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "srptools";
  version = "1.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-f6QzclahVC6PW7S+0Z4dmuqY/l/5uvdmkzQqHdasfJY=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "srptools" ];

  meta = {
    description = "Module to implement Secure Remote Password (SRP) authentication";
    homepage = "https://github.com/idlesign/srptools";
    license = lib.licenses.bsd3;
  };
})
