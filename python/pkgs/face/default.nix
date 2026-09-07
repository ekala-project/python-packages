{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  flit-core,

  # dependencies
  boltons,
}:

buildPythonPackage rec {
  pname = "face";
  version = "26.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-gYPZS8JIuq6oVan4RF+XoiqZiJCOYKvdzMbiUdp3xMY=";
  };

  build-system = [ flit-core ];

  dependencies = [ boltons ];

  pythonImportsCheck = [ "face" ];

  meta = {
    homepage = "https://github.com/mahmoud/face";
    description = "Command-line interface parser and framework";
    license = lib.licenses.bsd3;
  };
}
