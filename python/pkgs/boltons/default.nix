{
  lib,
  fetchPypi,
  buildPythonPackage,
  flit-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "boltons";
  version = "26.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-05z9FcGhw71NcFyCJS+p7bjk9ejMA5+OOa+sextH6Sw=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "boltons" ];

  meta = {
    homepage = "https://github.com/mahmoud/boltons";
    description = "Constructs, recipes, and snippets extending the Python standard library";
    license = lib.licenses.bsd3;
  };
})
