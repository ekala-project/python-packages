{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  click,
}:

buildPythonPackage (finalAttrs: {
  pname = "srptools";
  version = "2.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-O1KW/eS3DnZEO76sxkH05BJcgba9IOTiKLujQPAMBsU=";
  };

  build-system = [ hatchling ];

  optional-dependencies = {
    cli = [ click ];
  };

  pythonImportsCheck = [ "srptools" ];

  meta = {
    description = "Module to implement Secure Remote Password (SRP) authentication";
    homepage = "https://github.com/idlesign/srptools";
    license = lib.licenses.bsd3;
  };
})
