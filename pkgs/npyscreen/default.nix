{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "npyscreen";
  version = "4.10.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Yi7g+aXa6UbmNbfG4PbWXh7TyeoNILidq39Y1YDlEm4=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "npyscreen" ];

  meta = {
    description = "Framework for developing console applications using Python and curses";
    homepage = "https://www.npcole.com/npyscreen/";
    license = lib.licenses.bsd3;
  };
}
