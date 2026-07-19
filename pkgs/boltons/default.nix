{
  lib,
  fetchPypi,
  buildPythonPackage,
  flit-core,
}:

buildPythonPackage rec {
  pname = "boltons";
  version = "25.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-4RD73DC3uYaMtgTj9x1HIt2PTctKXd0GAouo8asLWs4=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "boltons" ];

  meta = {
    homepage = "https://github.com/mahmoud/boltons";
    description = "Constructs, recipes, and snippets extending the Python standard library";
    license = lib.licenses.bsd3;
  };
}
