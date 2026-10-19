{
  lib,
  fetchPypi,
  buildPythonPackage,
  flit-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "boltons";
  version = "26.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-V2RGirpJOxWZXtF/RqFniQI/Ejyipi1JGpzoJcHL4mw=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "boltons" ];

  meta = {
    homepage = "https://github.com/mahmoud/boltons";
    description = "Constructs, recipes, and snippets extending the Python standard library";
    license = lib.licenses.bsd3;
  };
})
