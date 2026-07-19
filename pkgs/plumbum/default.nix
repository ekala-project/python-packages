{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  hatch-vcs,
}:

buildPythonPackage rec {
  pname = "plumbum";
  version = "2.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-YWI/hW3LCesg3NWqcI37PNBLb0qxAiTTkwOxY7scTGE=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  pythonImportsCheck = [ "plumbum" ];

  meta = {
    description = "Plumbum: shell combinators library";
    homepage = "https://github.com/tomerfiliba/plumbum";
    license = lib.licenses.mit;
  };
}
