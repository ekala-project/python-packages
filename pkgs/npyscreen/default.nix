{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "npyscreen";
  version = "5.0.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-PWxyB8zNCNkmmATu7ZYLQGeOmeiRiAov2TbyPGbVwVY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "npyscreen" ];

  meta = {
    description = "Framework for developing console applications using Python and curses";
    homepage = "https://www.npcole.com/npyscreen/";
    license = lib.licenses.bsd3;
  };
}
