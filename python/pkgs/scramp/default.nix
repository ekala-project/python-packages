{
  lib,
  asn1crypto,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  versioningit,
}:

buildPythonPackage (finalAttrs: {
  pname = "scramp";
  version = "1.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-IbiKVLxLZW9X3p8Pa+Uxypn37+SSILvQg7hM+IdI45U=";
  };

  build-system = [
    hatchling
    versioningit
  ];

  dependencies = [ asn1crypto ];

  pythonImportsCheck = [ "scramp" ];

  meta = {
    description = "Implementation of the SCRAM authentication protocol";
    homepage = "https://codeberg.org/tlocke/scramp";
    license = lib.licenses.mit;
  };
})
