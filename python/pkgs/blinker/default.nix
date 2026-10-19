{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  flit-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "blinker";
  version = "1.9.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-tM4iZaer7ORefMiW6Y2+vmzq1WvPgFo9IxNtFF9URb8=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "blinker" ];

  meta = {
    description = "Fast Python in-process signal/event dispatching system";
    homepage = "https://github.com/pallets-eco/blinker/";
    license = lib.licenses.mit;
  };
})
