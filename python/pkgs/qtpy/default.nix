{
  lib,
  buildPythonPackage,
  fetchPypi,

  # propagates
  packaging,
}:

buildPythonPackage rec {
  pname = "qtpy";
  version = "2.4.3";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-23RPeDLm09qQVoumzLyj7is7SokMPW+7xjFC9uTN9bs=";
  };

  propagatedBuildInputs = [ packaging ];

  doCheck = false; # ModuleNotFoundError: No module named 'PyQt5.QtConnectivity'
  meta = {
    description = "Abstraction layer for PyQt5/PyQt6/PySide2/PySide6";
    mainProgram = "qtpy";
    homepage = "https://github.com/spyder-ide/qtpy";
    license = lib.licenses.mit;
  };
}
