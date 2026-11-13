{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "hatch-tryton";
  version = "0.1.1";
  pyproject = true;

  src = fetchPypi {
    pname = "hatch_tryton";
    inherit (finalAttrs) version;
    hash = "sha256-0NccQKXyC811K+90Pn1xPBUASQ/zzAripwnv9jnpA0U=";
  };

  build-system = [ hatchling ];

  dependencies = [ hatchling ];

  pythonImportsCheck = [ "hatch_tryton" ];

  meta = {
    description = "Hatchling plugin for Tryton";
    homepage = "https://code.tryton.org/hatch-tryton";
    license = lib.licenses.mit;
  };
})
