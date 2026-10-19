{
  lib,
  buildPythonPackage,
  fetchPypi,
  poetry-core,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "hvac";
  version = "2.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-4AVq2QZOeSPodOZ2kBWwMlgLY54pJG9asQRPeVnBx+A=";
  };

  build-system = [ poetry-core ];

  dependencies = [ requests ];

  pythonImportsCheck = [ "hvac" ];

  meta = {
    description = "HashiCorp Vault API client";
    homepage = "https://github.com/ianunruh/hvac";
    license = lib.licenses.asl20;
  };
})
